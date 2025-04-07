part of 'register_data_selected_bloc.dart';

@immutable
sealed class RegisterDataSelectedEvent {}

class SelectedDataChooseItem extends RegisterDataSelectedEvent {
  final SectionItemData items;
  SelectedDataChooseItem(this.items);
}

class SaveSelectedDataChoose extends RegisterDataSelectedEvent {}
