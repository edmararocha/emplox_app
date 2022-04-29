import 'package:emplox/src/repositories/routes.dart';

class UserRepository {
  final routes = Routes();

  Future fetchUserLogin (String username, String password) async {
    final response = await routes.login(username, password);
    return response['auth'];
  }

  Future fetchUserRegister (String username, String email, String password) async {
    final response = await routes.register(username, email, password);
    return response['error'];
  }
}