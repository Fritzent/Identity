part of 'register_data_selected_bloc.dart';

class RegisterDataSelectedState {
  final List<SectionItemData> selectedItems;
  final bool isLoading;
  final bool isError;
  final String errorMessage;
  final bool isChooseDataDone;

  RegisterDataSelectedState({
    required this.selectedItems,
    this.isLoading = false,
    this.isError = false,
    this.errorMessage = '',
    this.isChooseDataDone = false,
  });

  RegisterDataSelectedState copyWith({
    List<SectionItemData>? selectedItems,
    bool? isLoading,
    bool? isError,
    String? errorMessage,
    bool? isChooseDataDone,
  }) {
    return RegisterDataSelectedState(
      selectedItems: selectedItems ?? this.selectedItems,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      isChooseDataDone: isChooseDataDone ?? this.isChooseDataDone,
    );
  }
}
