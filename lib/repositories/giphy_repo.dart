import 'package:scroll_list_search/api.dart';
import 'package:scroll_list_search/models/gif_model.dart';

class GiphyRepo {
  Future<List<GifModel>> read(
      int offset, String text, List<GifModel> list) async {
    List<GifModel> items = await ApiClass().request(offset, text);
    List<GifModel> oldItems = list;
    oldItems.addAll(items);
    return oldItems;
  }
}
