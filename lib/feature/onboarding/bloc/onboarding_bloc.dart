import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final pageController = PageController();
  OnboardingBloc() : super(OnboardingInitial(currentIndex: 0)) {
    on<OnChangeIndex>(onChangeindex);
  }

  void onChangeindex(OnChangeIndex event, Emitter<OnboardingState> emit) {
    emit(OnboardingInitial(currentIndex: event.index));
  }
}
