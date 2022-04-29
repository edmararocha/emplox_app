import 'package:flutter/material.dart';

import '../models/UserModel.dart';
import '../repositories/login_repository.dart';

abstract class LoginContract {
  // void loginStart();
  void loginSuccess();
  void loginError();
  void loginManangement();
}

class LoginPresenter {
  final formKey = GlobalKey<FormState>();

  final LoginRepository loginRepository;
  final LoginContract loginContract;

  bool isLoading = false;

  LoginPresenter(this.loginRepository, this.loginContract);

  UserModel user = UserModel();

  userEmail (String value) => {user.email = value};
  userPassword (String value) => {user.password = value};
  
  loginManangement() async {
    late bool isLogin;
    isLoading = true;
    loginContract.loginManangement();
    
    if (!formKey.currentState!.validate()) {
      isLoading = false;
    } else {
      formKey.currentState!.save();

      try {
        isLogin = await loginRepository.doLogin(user);
        print("isLogin: $isLogin");
      } catch (e) {
        isLogin = false;
      }
    }

    isLoading = false;
    loginContract.loginManangement();

    print(user.email);
    print(user.password);

    if (isLogin) {
      loginContract.loginSuccess();
    } else {
      loginContract.loginError();
    }
  }
}