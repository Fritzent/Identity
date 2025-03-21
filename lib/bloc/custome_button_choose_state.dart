part of 'custome_button_choose_bloc.dart';

class CustomeButtonChooseState {
  final bool isTapped;

  CustomeButtonChooseState({
    this.isTapped = false,
  });

  CustomeButtonChooseState copyWith({
    bool? isTapped,
  }) {
    return CustomeButtonChooseState(
      isTapped: isTapped ?? this.isTapped,
    );
  }
}
