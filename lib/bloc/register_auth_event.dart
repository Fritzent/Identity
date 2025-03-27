part of 'register_auth_bloc.dart';

@immutable
sealed class RegisterAuthEvent {}

class OnRegisterAuth extends RegisterAuthEvent {}
