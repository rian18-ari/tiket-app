import 'package:news_trial/app/data/models/tiket_articles.dart';

class TiketResponse {
  final int? status;
  final String? message;
  final List<TiketArticles>? data;

  TiketResponse({this.status, this.message, this.data});

  factory TiketResponse.fromJson(Map<String, dynamic> json) {
    return TiketResponse(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List<dynamic>)?.map((e) => TiketArticles.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'message': message, 'data': data};
  }
}
