part of 'personal_url_bloc.dart';

class PersonalUrlState {
  final bool isLinkedInVisible;
  final bool isInstagramVisible;
  final bool isWebsiteVisible;
  final bool isProjectVisible;
  final bool isValidDataForm;
  final String linkedInUrl;
  final String instagramUrl;
  final String websiteUrl;
  final String projectUrl;
  final List<Map<String, String>> fieldErrorComponent;
  final bool isLoading;
  final bool isError;
  final String errorMessage;
  final bool isRegisterLinkDone;

  PersonalUrlState({
    this.isLinkedInVisible = false,
    this.isInstagramVisible = false,
    this.isWebsiteVisible = false,
    this.isProjectVisible = false,
    this.isValidDataForm = false,
    this.linkedInUrl = '',
    this.instagramUrl = '',
    this.websiteUrl = '',
    this.projectUrl = '',
    List<Map<String, String>>? fieldErrorComponent,
    this.isLoading = false,
    this.isError = false,
    this.errorMessage = '',
    this.isRegisterLinkDone = false,
  }) : fieldErrorComponent = fieldErrorComponent ?? [];

  PersonalUrlState copyWith({
    bool? isLinkedInVisible,
    bool? isInstagramVisible,
    bool? isWebsiteVisible,
    bool? isProjectVisible,
    bool? isValidDataForm,
    String? linkedInUrl,
    String? instagramUrl,
    String? websiteUrl,
    String? projectUrl,
    List<Map<String, String>>? fieldErrorComponent,
    bool? isLoading,
    bool? isError,
    String? errorMessage,
    bool? isRegisterLinkDone,
  }) {
    return PersonalUrlState(
      isLinkedInVisible: isLinkedInVisible ?? this.isLinkedInVisible,
      isInstagramVisible: isInstagramVisible ?? this.isInstagramVisible,
      isWebsiteVisible: isWebsiteVisible ?? this.isWebsiteVisible,
      isProjectVisible: isProjectVisible ?? this.isProjectVisible,
      isValidDataForm: isValidDataForm ?? this.isValidDataForm,
      linkedInUrl: linkedInUrl ?? this.linkedInUrl,
      instagramUrl: instagramUrl ?? this.instagramUrl,
      websiteUrl: websiteUrl ?? this.websiteUrl,
      projectUrl: projectUrl ?? this.projectUrl,
      fieldErrorComponent: fieldErrorComponent ?? this.fieldErrorComponent,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      isRegisterLinkDone: isRegisterLinkDone ?? this.isRegisterLinkDone,
    );
  }
}
