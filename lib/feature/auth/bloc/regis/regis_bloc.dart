import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:umc_mobile/feature/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:umc_mobile/model/user_model.dart';

part 'regis_event.dart';
part 'regis_state.dart';

class RegisBloc extends Bloc<RegisEvent, RegisState> {
  final usernameC = TextEditingController();
  final passwordC = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  RegisBloc()
      : super(RegisInitial(errorMessage: '', status: RegisStatus.idle)) {
    on<OnRegisEvent>(onRegisEvent);
    on<ClearEvent>(clearEvent);
  }

  @mustCallSuper
  @override
  Future<void> close() async {
    debugPrint('Menjalankan onDispose Bloc');
    usernameC.dispose();
    passwordC.dispose();
    return super.close();
  }

  Future<void> onRegisEvent(
      OnRegisEvent event, Emitter<RegisState> emit) async {
    emit(RegisInitial(status: RegisStatus.loading, errorMessage: ''));
    debugPrint('State 1');
    var enteredUsername = usernameC.text;
    var enteredPassword = passwordC.text;

    debugPrint('State 2');
    var usermodel =
        UserModel(username: enteredUsername, password: enteredPassword);

    try {
      if (userModels.any((user) => user.username == enteredUsername)) {
        emit(RegisInitial(
            status: RegisStatus.erorr,
            errorMessage: 'Username sudah ada,coba lagi'));
        return;
      }
      userModels.add(usermodel);
      emit(RegisInitial(status: RegisStatus.success, errorMessage: ''));
    } catch (e) {
      emit(RegisInitial(status: RegisStatus.erorr, errorMessage: e.toString()));
    }
  }

  void clearEvent(ClearEvent event, Emitter<RegisState> emit) async {
    debugPrint('State 1');
    passwordC.clear();
    usernameC.clear();
  }
}
