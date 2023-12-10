part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class OnChangeIndex extends HomeEvent {
  final int index;

  OnChangeIndex({required this.index});
}
