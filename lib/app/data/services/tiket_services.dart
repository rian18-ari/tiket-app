import 'dart:developer';

import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:news_trial/app/data/constant.dart';
import 'package:news_trial/app/data/models/tiket_response.dart';

class TiketServices extends GetConnect {
  Future<TiketResponse> getTiket() async {
    final baseUrl = Constant.baseUrl;

    try {
      print('sedang memanggil API...');
      final response = await get('$baseUrl/users');
      if (response.statusCode == 200) {
        return TiketResponse.fromJson(response.body);
      } else {
        return TiketResponse(status: 0, message: 'Error: ${response.body}');
      }
    } catch (e, stacktrace) {
      debugPrint('error_log $e $stacktrace');
      return TiketResponse(status: 0, message: 'Error: $e');
    }
  }
}