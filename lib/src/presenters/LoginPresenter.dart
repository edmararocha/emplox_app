import 'package:flutter/material.dart';
import '../repositories/user_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

abstract class LoginContract {
  loginStart();
  loginLoading();
  loginSuccess();
  loginError();
  loadingManagement();
}

class LoginPresenter {

  final LoginContract loginContract;

  UserRepository _userRepository = UserRepository();
  
  final state = ValueNotifier<LoginState>(LoginState.start);

  bool isLoading = false;

  LoginPresenter(this.loginContract);

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  loginManangement(user, password) async {
    late bool isLogin;

    state.value = LoginState.loading;
    isLoading = true;
    loginContract.loadingManagement();

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      print(connectivityResult.index);
      if (connectivityResult.index != 4) {
        try {
          isLogin = await _userRepository.fetchUserLogin(user, password);

          if (isLogin) {
            isLoading = false;
            loginContract.loadingManagement();
            print("isLogin: $isLogin");
            loginContract.loginSuccess();
          }

        } catch (e) {
          state.value = LoginState.error;
          print(e);
        }
      }
    } catch (e) {
      state.value = LoginState.error;
    }
  }

  stateManagement(LoginState state) {
    switch (state) {
      case LoginState.start:
        return loginContract.loginStart();
      case LoginState.loading:
        return loginContract.loginLoading();
      case LoginState.error:
        return loginContract.loginError();
    }
  }
}

enum LoginState {start, error, loading} 