part of 'theme_data_bloc.dart';

class ThemeDataState {
  final ThemeMode themeMode;
  final bool isError;
  final String errorMessage;
  final bool isLoading;

  ThemeDataState({
    this.themeMode = ThemeMode.light,
    this.isError = false,
    this.errorMessage = '',
    this.isLoading = false,
  });

  ThemeDataState copyWith ({
    ThemeMode? themeMode,
    bool? isError,
    String? errorMessage,
    bool? isLoading,
  }){
    return ThemeDataState(
      themeMode: themeMode ?? this.themeMode,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
