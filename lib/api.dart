import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
}
