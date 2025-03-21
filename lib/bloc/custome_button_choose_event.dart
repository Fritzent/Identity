part of 'custome_button_choose_bloc.dart';

@immutable
sealed class CustomeButtonChooseEvent {}

class OnTapped extends CustomeButtonChooseEvent {
  final bool isTapped;
  OnTapped(this.isTapped);
}
