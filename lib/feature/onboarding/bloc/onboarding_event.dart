part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingEvent {}

class OnChangeIndex extends OnboardingEvent {
  final int index;

  OnChangeIndex({required this.index});
}
