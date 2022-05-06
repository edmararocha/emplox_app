import 'package:emplox/src/repositories/routes.dart';

import '../models/FuncModel.dart';

class FuncRepository {
  final routes = Routes();

  Future fetchFuncList() async {
    final response = await routes.funcList();
    final list = response['employees'] as List;
    return list.map((json) => FuncModel.fromJson(json)).toList();
  }

  Future fetchFuncRegister(String name, String role) async {
    final response = await routes.registerFunc(name, role);
    return response['error'];
  }

  Future fetchUpdateFunc (String username, String email, int? id) async {
    final response = await routes.updateFunc(username, email, id);
    return response['error'];
  }

  Future fetchDeleteFunc (int id) async {
    final response = await routes.deleteFunc(id);
    return response['error'];
  }
}