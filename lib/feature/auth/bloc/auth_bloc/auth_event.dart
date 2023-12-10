part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class OnLoginEvent extends AuthEvent {}

class ClearEvent extends AuthEvent {}
