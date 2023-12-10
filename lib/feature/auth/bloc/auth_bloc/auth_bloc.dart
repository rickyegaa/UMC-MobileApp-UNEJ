import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:umc_mobile/model/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

final List<UserModel> userModels = [
  UserModel(
    username: 'Andrew19',
    password: 'password',
  ),
];

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final usernameC = TextEditingController(text: kDebugMode ? 'Andrew19' : '');
  final passwordC = TextEditingController(text: kDebugMode ? 'password' : '');
  AuthBloc() : super(AuthInitial(errorMessage: '', status: AuthStatus.idle)) {
    on<OnLoginEvent>(onLoginEvent);
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

  Future<void> onLoginEvent(OnLoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthInitial(status: AuthStatus.loading, errorMessage: ''));
    debugPrint('State 1');
    var enteredUsername = usernameC.text;
    var enteredPassword = passwordC.text;
    for (UserModel user in userModels) {
      debugPrint('State 2');
      // debugPrint(userModels.length.toString());
      if (user.username == enteredUsername &&
          user.password == enteredPassword) {
        emit(AuthInitial(status: AuthStatus.success, errorMessage: ''));
        return;
      }
    }
    emit(AuthInitial(status: AuthStatus.error, errorMessage: 'Eror'));
  }

  void clearEvent(ClearEvent event, Emitter<AuthState> emit) async {
    debugPrint('State 1');
    passwordC.clear();
    usernameC.clear();
  }
}
