import '../models/UserModel.dart';

class LoginRepository {
  bool doLogin (UserModel model) {
    Future.delayed(Duration(seconds: 2));
    if (model.email == "ed@gmail.com" && model.password == "123") {
     return true;
    } else {
      return false;
    }
  }
}