part of 'cv_upload_bloc.dart';

@immutable
sealed class CvUploadEvent {}

class PickAndSaveFile extends CvUploadEvent {}

class OnSubmitCV extends CvUploadEvent {}
