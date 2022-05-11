import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../repositories/user_repository.dart';

abstract class RegisterContract {
  registerStart();
  registerLoading();
  registerSuccess();
  registerError(String message);
  loadingManagement();
}

class RegisterPresenter {

  final RegisterContract registerContract;

  UserRepository _userRepository = UserRepository();
  
  final state = ValueNotifier<RegisterState>(RegisterState.start);

  bool isLoading = false;
  String message = "";

  RegisterPresenter(this.registerContract);

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  registerManangement(user, email, password) async {
    late bool isRegister;

    state.value = RegisterState.loading;
    isLoading = true;
    registerContract.loadingManagement();
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      print(connectivityResult.index);
      if (connectivityResult.index != 4) {
        try {
          isRegister = await _userRepository.fetchUserRegister(user, email, password);

          if (!isRegister) {
            isLoading = false;
            registerContract.loadingManagement();
            print("isRegister: $isRegister");
            registerContract.registerSuccess();
          }

        } catch (e) {
          message = "Não foi possível cadastrar o usuário!";
          state.value = RegisterState.error;
        }
      } else {
        message = "Sem conexão com a internet";
        state.value = RegisterState.error;
      }
    } catch (e) {
      state.value = RegisterState.error;
    }
  }

  stateManagement(RegisterState state) {
    switch (state) {
      case RegisterState.start:
        return registerContract.registerStart();
      case RegisterState.loading:
        return registerContract.registerLoading();
      case RegisterState.error:
        return registerContract.registerError(message);
    }
  }
}

enum RegisterState {start, error, loading} 