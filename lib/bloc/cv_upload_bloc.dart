import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:identity/database/cv.dart';

part 'cv_upload_event.dart';
part 'cv_upload_state.dart';

class CvUploadBloc extends Bloc<CvUploadEvent, CvUploadState> {
  final Box pdfBox = Hive.box('cvPdfFileBox');

  CvUploadBloc() : super(CvUploadState()) {
    on<PickAndSaveFile>(onPickAndSaveFile);
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
              isUploaded: true));
        } else {
          File file = File(result.files.single.path!);
          int fileSize = file.lengthSync();
          double fileSizeInKB = (fileSize / 1024).ceilToDouble();
          emit(
              state.copyWith(fileName: fileName, fileSize: '$fileSizeInKB KB'));

          int bytesRead = 0;
          Stream<List<int>> stream = file.openRead();
          await for (var chunk in stream) {
            fileBytes.addAll(chunk);
            bytesRead += chunk.length;
            emit(state.copyWith(
                uploadProgress: bytesRead / fileSize, isUploaded: true));
          }
        }

        CvPdfFile pdf = CvPdfFile(fileName: fileName, fileBytes: fileBytes);
        await pdfBox.add(pdf);
      }
    } catch (e) {
      emit(state.copyWith(isError: true, errorMessage: e.toString()));
    }
  }
}
