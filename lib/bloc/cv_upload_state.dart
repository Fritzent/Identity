part of 'cv_upload_bloc.dart';

class CvUploadState {
  final double uploadProgress;
  final String fileName;
  final bool isUploaded;
  final bool isError;
  final String errorMessage;
  final List<String> allowExtensions;
  final String fileSize;

  CvUploadState(
      {this.uploadProgress = 0.0,
      this.fileName = '',
      this.isUploaded = false,
      this.isError = false,
      this.errorMessage = '',
      this.allowExtensions = const ['pdf'],
      this.fileSize = ''});

  CvUploadState copyWith({
    double? uploadProgress,
    String? fileName,
    bool? isUploaded,
    bool? isError,
    String? errorMessage,
    List<String>? allowExtensions,
    String? fileSize,
  }) {
    return CvUploadState(
        uploadProgress: uploadProgress ?? this.uploadProgress,
        fileName: fileName ?? this.fileName,
        isUploaded: isUploaded ?? this.isUploaded,
        isError: isError ?? this.isError,
        errorMessage: errorMessage ?? this.errorMessage,
        allowExtensions: allowExtensions ?? this.allowExtensions,
        fileSize: fileSize ?? this.fileSize);
  }
}
