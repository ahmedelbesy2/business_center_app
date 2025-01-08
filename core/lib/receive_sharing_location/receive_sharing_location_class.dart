import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ReceiveSharingLocation {
  final Dio _dio;

  ReceiveSharingLocation({required Dio dio}) : _dio = dio ?? Dio();

  Future<String> expandShortUrlWithDio(String shortUrl) async {
    try {
      final response = await _dio.headUri(Uri.parse(shortUrl),
          options: Options(headers: {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36',
          }));

      if (response.statusCode == 301 || response.statusCode == 302) {
        debugPrint('full link ====== ${response.realUri.toString()}');
        return response.realUri.toString();
      } else {
        debugPrint('failed to get the link');
        return shortUrl;
      }
    } catch (e) {
      throw Exception('Failed to expand URL: $e');
    }
  }

  Future<Map<String, String>> getLatLngFromShortUrl(String shortUrl) async {
    try {
      var expandedUrl = await expandShortUrlWithDio(shortUrl);
      if (expandedUrl == null) {
        throw Exception('Failed to expand URL');
      }

      RegExp exp = RegExp(r'@(-?\d+\.\d+),(-?\d+\.\d+)');
      var match = exp.firstMatch(expandedUrl);
      if (match != null) {
        return {
          'latitude': match.group(1) ?? '',
          'longitude': match.group(2) ?? '',
        };
      } else {
        throw Exception('LatLng not found in URL');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
