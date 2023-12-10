import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final pageController = PageController();
  HomeBloc() : super(HomeInitial(currentIndex: 0)) {
    on<OnChangeIndex>(onChangeindex);
  }

  void onChangeindex(OnChangeIndex event, Emitter<HomeState> emit) {
    emit(HomeInitial(currentIndex: event.index));
  }
}
