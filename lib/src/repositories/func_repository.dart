import 'package:emplox/src/repositories/routes.dart';

import '../models/FuncModel.dart';

class FuncRepository {
  final routes = Routes();

  Future fetchFuncList() async {
    final response = await routes.funcList();
    final list = response['employees'] as List;
    return list.map((json) => FuncModel.fromJson(json)).toList();
  }

  // Future fetchCreateFunc (String username, String password) async {
  //   final response = await routes.login(username, password);
  //   return response['auth'];
  // }

  // Future fetchUpdateFunc (String username, String email, String password) async {
  //   final response = await routes.register(username, email, password);
  //   return response['error'];
  // }

  // Future fetchDeleteFunc (String username, String email, String password) async {
  //   final response = await routes.register(username, email, password);
  //   return response['error'];
  // }

}