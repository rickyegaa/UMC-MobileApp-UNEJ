part of 'auth_bloc.dart';

enum AuthStatus { idle, error, success, loading }

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {
  final AuthStatus status;
  final String errorMessage;

  AuthInitial({
    required this.status,
    required this.errorMessage,
  });
}
