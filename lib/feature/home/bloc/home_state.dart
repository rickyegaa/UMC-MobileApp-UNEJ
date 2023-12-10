part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {
  final int currentIndex;

  HomeInitial({required this.currentIndex});
}
