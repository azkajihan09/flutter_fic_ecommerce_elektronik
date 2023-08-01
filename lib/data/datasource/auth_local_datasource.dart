import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/responses/auth_response_model.dart';

class AuthLocalDatasource {
  Future<bool> saveAuthData(AuthResponseModel model) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = await prefs.setString('auth', jsonEncode(model.toJson()));

    return result;
  }

  Future<bool> removeAuthData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = await prefs.remove('auth');

    return result;
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final authJson = prefs.getString('auth') ?? '';
    final authData = AuthResponseModel.fromJson(jsonDecode(authJson));

    return authData.jwt;
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final authJson = prefs.getString('auth') ?? '';
    final authData = AuthResponseModel.fromJson(jsonDecode(authJson));
    return authData.user;
  }

  Future<bool> isLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final authJson = prefs.getString('auth');
    return authJson != null;
  }
}
