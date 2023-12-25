import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CatsRepository {
  static final Dio _client = Dio();

  static Future<List<String>?> getUrlsWithLimit(int limit) async {
    try {
      final String catUrlWithLimit =
          'https://api.thecatapi.com/v1/images/search?limit=$limit ';
      final response = await _client.get(catUrlWithLimit,
          options: Options(headers: {
            'x-api-key':
                'live_Wd1wgQBJOZoFsN38n37Oy1WVrB8ecaB7q6M0kkBWjRZq5i5bcLlAx7r4SoAp6JNx'
          }));
      if (response.statusCode == 200) {
        return (response.data as List).map<String>((e) => e['url']).toList();
      }

      throw Exception('Invalid Data ${response.statusMessage}');
    } catch (e) {
      debugPrint('[getUrlsWithLimit]>> erro in $e');
      rethrow;
    }
  }
}
