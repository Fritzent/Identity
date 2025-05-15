import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:identity/database/cv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:identity/model/data_stepper_model.dart' as data_stepper;

part 'cv_upload_event.dart';
part 'cv_upload_state.dart';

class CvUploadBloc extends Bloc<CvUploadEvent, CvUploadState> {
  final Box pdfBox = Hive.box('cvPdfFileBox');
  final Box userBox = Hive.box('userBox');

  CvUploadBloc() : super(CvUploadState()) {
    on<PickAndSaveFile>(onPickAndSaveFile);
    on<OnSubmitCV>(onSubmitCV);
  }

  FutureOr<void> onPickAndSaveFile(
      PickAndSaveFile event, Emitter<CvUploadState> emit) async {
    try {
      if (pdfBox.isNotEmpty) {
        await pdfBox.clear();
      }

      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: state.allowExtensions,
        withData: kIsWeb,
      );

      if (result != null) {
        String fileName = result.files.single.name;
        List<int> fileBytes = [];

        if (kIsWeb) {
          fileBytes = result.files.single.bytes!;
          emit(state.copyWith(
              fileName: fileName,
              fileSize: '${fileBytes.length ~/ 1024} KB',
              uploadProgress: 0.5,
              isUploaded: true));

          final publicUrl = await _uploadToSupabase(fileBytes, fileName);
          emit(state.copyWith(
            uploadProgress: 1.0,
            isUploaded: true,
            publicUrl: publicUrl,
          ));
        } else {
          File file = File(result.files.single.path!);
          int fileSize = file.lengthSync();
          double fileSizeInKB = (fileSize / 1024).ceilToDouble();
          emit(state.copyWith(
              fileName: fileName,
              fileSize: '$fileSizeInKB KB',
              uploadProgress: 0.0));

          final raf = file.openSync(mode: FileMode.read);
          const chunkSize = 64 * 1024;
          int offset = 0;
          fileBytes = List<int>.filled(fileSize, 0);

          while (offset < fileSize) {
            final length =
                (offset + chunkSize > fileSize) ? fileSize - offset : chunkSize;
            final chunk = raf.readSync(length);
            fileBytes.setRange(offset, offset + chunk.length, chunk);
            offset += chunk.length;
            emit(state.copyWith(
              uploadProgress: (offset / fileSize) * 0.5,
            ));
            await Future.delayed(Duration(milliseconds: 10));
          }
          raf.closeSync();

          final publicUrl = await _uploadToSupabase(fileBytes, fileName);
          emit(state.copyWith(
            uploadProgress: 1.0,
            isUploaded: true,
            publicUrl: publicUrl,
          ));
        }

        CvPdfFile pdf = CvPdfFile(fileName: fileName, fileBytes: fileBytes);
        await pdfBox.add(pdf);
      }
    } catch (e) {
      emit(state.copyWith(isError: true, errorMessage: e.toString()));
    }
  }

  Future<String> _uploadToSupabase(List<int> bytes, String fileName) async {
    final supabase = Supabase.instance.client;
    final storage = supabase.storage.from('identityfiles');
    final pathInBucket = 'cv/$fileName';

    await storage.uploadBinary(
      pathInBucket,
      Uint8List.fromList(bytes),
      fileOptions:
          const FileOptions(upsert: true, contentType: 'application/pdf'),
    );

    return storage.getPublicUrl(pathInBucket);
  }

  FutureOr<void> onSubmitCV(
      OnSubmitCV event, Emitter<CvUploadState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      await saveCvDataToDatabase();
      await updatedDataStepper(emit);
      emit(state.copyWith(
        isLoading: false,
        isError: false,
        errorMessage: '',
        isRegisterCVDone: true,
      ));
    } catch (e) {
      emit(state.copyWith(
          isLoading: false,
          isError: true,
          errorMessage: e.toString(),
          isRegisterCVDone: false));
    }
  }

  FutureOr<void> saveCvDataToDatabase() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final cvUploadedCollection =
            FirebaseFirestore.instance.collection('CvUploaded');
        if (userBox.isNotEmpty) {
          var firstKey = userBox.keys.first;
          var firstValue = userBox.get(firstKey);
          await cvUploadedCollection.doc(user.uid).set({
            'uid': user.uid,
            'userId': firstValue.userId,
            'supabase_url': state.publicUrl,
          });
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  FutureOr<void> updatedDataStepper(Emitter<CvUploadState> emit) async {
    try {
      String onProgressDataStep = '';
      final stepperCollection =
          FirebaseFirestore.instance.collection('DataStepper');
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final docSnapshot = await stepperCollection.doc(user.uid).get();
        if (docSnapshot.exists) {
          final dataStepper =
              data_stepper.DataStepper.fromJson(docSnapshot.data()!);

          if (dataStepper.listStepThirdSelected?.isNotEmpty ?? false) {
            onProgressDataStep = 'step_three';
          }
          else {
            onProgressDataStep = 'done';
          }

          await FirebaseFirestore.instance
              .collection('DataStepper')
              .doc(user.uid)
              .update({
            'onprogress_data_step': onProgressDataStep,
          });
        }
      }

    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        isError: true,
        errorMessage: e.toString(),
        isRegisterCVDone: false,
      ));
    }
  }
}
