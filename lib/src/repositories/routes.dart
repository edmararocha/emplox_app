import 'package:dio/dio.dart';

class Routes {
  final String baseUrl = 'http://192.168.124.107:3000/';
  final Dio dio = Dio();

  Future login(String username, String password) async {
    String route = baseUrl + 'admin/login';

    try {
      var response = await dio.post(route,
          data: {"username": username, "password": password},
          options: Options(
            contentType: Headers.jsonContentType,
          ));
      return response.data;
    } catch (e) {
      throw Exception("[-] Erro ao realizar login: $e");
    }
  }

  Future register(String username, String email, String password) async {
    String route = baseUrl + "admin";
    try {
      var response = await dio.post(route, 
      data:  {"username": username, "email": email, "password": password},
      options: Options(contentType: Headers.jsonContentType,));
      return response.data;

    } catch (e) {
      throw Exception('[-] Erro ao cadastrar usuário: $e');
    }
  }
}