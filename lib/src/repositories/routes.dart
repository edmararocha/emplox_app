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

  Future funcList() async {
    String route = baseUrl + "employee";

    try {
      var response = await dio.get(route);
      return response.data;

    } catch (e) {
      throw Exception("[-] Erro ao consultar funcionários: $e");
    }
  }

 Future registerFunc(String name, String role) async {
    String route = baseUrl + "employee";
    try {
      var response = await dio.post(route, 
      data:  {"name": name, "role": role},
      options: Options(contentType: Headers.jsonContentType,));
      return response.data;

    } catch (e) {
      throw Exception('[-] Erro ao cadastrar funcionário: $e');
    }
  }

  Future updateFunc(String name, String role, int? id) async {
    String route = baseUrl + "employee/$id";
    try {
      var response = await dio.put(route, 
      data:  {"name": name, "role": role},
      options: Options(contentType: Headers.jsonContentType,));
      return response.data;
    } catch (e) {
      throw Exception('[-] Erro ao atualizar funcionário: $e');
    }
  }

  Future deleteFunc(int? id) async {
    String route = baseUrl + "employee/$id";
    try {
      var response = await dio.delete(route, 
      options: Options(contentType: Headers.jsonContentType,));
      return response.data;

    } catch (e) {
      throw Exception('[-] Erro ao deletar funcionário: $e');
    }
  }
}