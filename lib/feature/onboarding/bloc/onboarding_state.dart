part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingState {}

final class OnboardingInitial extends OnboardingState {
  final int currentIndex;

  OnboardingInitial({required this.currentIndex});
}
