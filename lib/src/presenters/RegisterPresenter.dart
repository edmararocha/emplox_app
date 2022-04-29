import 'package:flutter/material.dart';

import '../repositories/user_repository.dart';

abstract class RegisterContract {
  registerStart();
  registerLoading();
  registerSuccess();
  registerError();
  loadingManagement();
}

class RegisterPresenter {

  final RegisterContract registerContract;

  UserRepository _userRepository = UserRepository();
  
  final state = ValueNotifier<RegisterState>(RegisterState.start);

  bool isLoading = false;

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
      isRegister = await _userRepository.fetchUserRegister(user, email, password);

      if (isRegister) {
        isLoading = false;
        registerContract.loadingManagement();
        print("isRegister: $isRegister");
        registerContract.registerSuccess();
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
        return registerContract.registerError();
    }
  }
}

enum RegisterState {start, error, loading} 