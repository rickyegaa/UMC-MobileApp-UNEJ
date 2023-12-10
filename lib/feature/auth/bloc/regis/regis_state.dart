part of 'regis_bloc.dart';

enum RegisStatus { idle, erorr, success, loading }

@immutable
sealed class RegisState {}

final class RegisInitial extends RegisState {
  final RegisStatus status;
  final String errorMessage;

  RegisInitial({
    required this.status,
    required this.errorMessage,
  });
}
