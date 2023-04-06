import 'dart:convert';
import 'package:app/constant/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  String token = '';
  String username = '';

  bool isLogin() {
    if (token.isNotEmpty && username.isNotEmpty) {
      return true;
    }
    return false;
  }

  String get getUsername => username;
  String get getToken => token;

  Future<String> register(
    String email,
    String username,
    String password,
  ) async {
    final url = Uri.parse(Api.register);

    final result = await http.post(
      url,
      body: {"username": username, "email": email, "password": password},
    );
    var errmessage = '';
    final parsedJson = jsonDecode(result.body);
    if (parsedJson["token"] != null) {
      token = parsedJson["token"];
      this.username = username;
      saveToDevice(token, username);
      notifyListeners();
    } else if (parsedJson['errors']['username'] != null) {
      errmessage = parsedJson['errors']['username']['msg'];
    } else if (parsedJson['errors']['email']) {
      errmessage = parsedJson['errors']['email']['msg'];
    } else {
      errmessage = parsedJson['errors']['password']['msg'];
    }
    return errmessage;
  }

  Future<String> login(String username, String password) async {
    var errmessage = '';
    final url = Uri.parse(Api.login);
    final result = await http
        .post(url, body: {"username": username, "password": password});

    final parsedJson = jsonDecode(result.body);
    if (parsedJson["token"] != null) {
      token = parsedJson["token"];
      this.username = username;
      saveToDevice(token, username);
      notifyListeners();
    } else if (parsedJson['errors']['username'] != null) {
      errmessage = parsedJson['errors']['username']['msg'];
    } else {
      errmessage = parsedJson['errors']['password']['msg'];
    }
    return errmessage;
  }

  void saveToDevice(String token, String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', this.token);
    await prefs.setString('username', this.username);
  }

  Future<String> changePassword(
    String email,
    String password,
  ) async {
    final url = Uri.parse(Api.changePassword);
    print(email);
    print(password);

    final result = await http.put(
      url,
      body: {"email": email, "password": password},
    );
    var errmessage = '';
    final parsedJson = jsonDecode(result.body);
    print(parsedJson);
    if (parsedJson['token'] != null) {
    } else if (parsedJson['errors']['email'] != null) {
      errmessage = parsedJson['errors']['email']['msg'];
    }
    return errmessage;
  }

  Future<void> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final username = prefs.getString('username');
    if (token != null && username != null) {
      this.token = token;
      this.username = username;
      notifyListeners();
    }
  }

  Future<void> logOut() async {
    token = '';
    username = '';
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
