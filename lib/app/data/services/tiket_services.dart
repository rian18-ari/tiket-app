import 'package:get/get.dart';
import 'package:news_trial/app/data/constant.dart';
import 'package:news_trial/app/data/models/tiket_response.dart';

class TiketServices extends GetConnect {
  Future<TiketResponse> getTiket() async {
    final baseUrl = Constant.baseUrl;

    try {
      final response = await get('$baseUrl/users');
      if (response.statusCode == 200) {
        return TiketResponse.fromJson(response.body);
      } else {
        return TiketResponse(status: 0, message: 'Error: ${response.body}');
      }
    } catch (e) {
      return TiketResponse(status: 0, message: 'Error: $e');
    }
  }
}