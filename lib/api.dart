import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scroll_list_search/models/gif_model.dart';

class ApiClass {
  final String apiKey = "eQ35setL5SbMZLUEWabdFjXaQmDgbzva";
  final dio = Dio();
  final int limit = 25;

  Future<List<GifModel>> request(int offset, String searchText) async {
    Response response;

    try {
      response = await dio.get(
        'https://api.giphy.com/v1/gifs/search',
        queryParameters: {
          'api_key': apiKey,
          'q': searchText,
          'offset': offset * limit,
          'limit': limit,
          'rating': 'g',
          'lang': 'en',
          'bundle': 'messaging_non_clips'
        },
      );
      var list =
          response.data["data"].map((data) => GifModel.fromMap(data)).toList();
      return List.from(list);
    } on Exception catch (e) {
      debugPrint("error = $e");
    }
    return [];
  }

  Future<Uint8List?> requestImage(String? url) async {
    Response response;

    try {
      response = await dio.get(url!,
          options: Options(
              headers: {'accept': 'image/*'},
              responseType: ResponseType.bytes));
      if (response.statusCode == 200) {
        return response.data;
      }
    } on Exception catch (e) {
      debugPrint("error = $e");
    }
    return null;
  }

  Future<Uint8List?> load(String? url) async {
    if (url == null) {
      return null;
    }
    final response =
        await http.get(Uri.parse(url), headers: {'accept': 'image/*'});

    if (response.statusCode == 200) {
      return response.bodyBytes;
    }
    return null;
  }
}
