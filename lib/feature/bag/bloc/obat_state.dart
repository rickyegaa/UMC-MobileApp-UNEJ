part of 'obat_bloc.dart';

@immutable
sealed class ObatState {}

final class ObatInitial extends ObatState {
  final List<ObatModel> models;

  ObatInitial({required this.models});
}
