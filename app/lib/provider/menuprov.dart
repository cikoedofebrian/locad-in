import 'dart:convert';
import 'package:app/constant/api.dart';
import 'package:app/model/menumodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MenuProvider extends ChangeNotifier {
  List<MenuModel> _list = [];
  List<MenuModel> _favoritelist = [];

  List<MenuModel> get list => _list;
  List<MenuModel> get favoriteList => _favoritelist;

  bool isFavorite(String id) {
    final result =
        _favoritelist.indexWhere((element) => element.id.toString() == id);
    if (result >= 0) {
      return true;
    } else {
      return false;
    }
  }

  void addToFavorite(String token, String id) async {
    final url = Uri.parse("${Api.favorite}/$id");
    final isAlreadyFavorite =
        _favoritelist.indexWhere((element) => element.id.toString() == id);
    if (isAlreadyFavorite >= 0) {
      await http.delete(url, headers: {'Authorization': "Bearer ${token}"});
      _favoritelist.removeAt(isAlreadyFavorite);
    } else {
      await http.post(url, headers: {'Authorization': "Bearer ${token}"});
      final pickedMenu =
          _list.firstWhere((element) => element.id.toString() == id);
      favoriteList.add(pickedMenu);
    }
    notifyListeners();
  }

  Future<void> fetchMenuData() async {
    _list = [];
    final url = Uri.parse(Api.menu);
    final result = await http.get(url);
    print(result.body);
    if (result.body != null) {
      final parsedJson = jsonDecode(result.body);
      for (var item in parsedJson['data']) {
        _list.add(
          MenuModel.fromJson(item),
        );
      }
    }
    notifyListeners();
  }

  Future<void> fetchFavoriteData(String token) async {
    _favoritelist = [];
    final url = Uri.parse(Api.favorite);
    final result =
        await http.get(url, headers: {'Authorization': "Bearer ${token}"});
    if (result.body != null) {
      final parsedJson = jsonDecode(result.body);
      for (var item in parsedJson['data']) {
        _favoritelist.add(
          MenuModel.fromJson(item['menu']),
        );
      }
    }
    notifyListeners();
  }
}
