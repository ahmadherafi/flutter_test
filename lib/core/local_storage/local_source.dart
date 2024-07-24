import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';


class LocalStorage {
  final storage = GetStorage("test");

  Future<void> init() async {
    await GetStorage.init("test");
  }

  Future<void> saveToken(String token) async {
    await storage.write("token", token);
  }

  String? get getToken {
   return  storage.read("token");
   
  }

  Future<void> clearCache() async {
    await storage.erase();
  }
}
