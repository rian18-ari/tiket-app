import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    final box = GetStorage();
    final String? token = box.read('token');

    // Jika user BELUM login, arahkan ke halaman login
    if (token == null || token.isEmpty) {
      return const RouteSettings(name: '/login-page');
    }

    return null;
  }
}
