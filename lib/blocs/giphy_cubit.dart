import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_list_search/models/gif_model.dart';
import 'package:scroll_list_search/repositories/giphy_repo.dart';

class GiphyCubit extends Cubit<List<GifModel>> {
  GiphyCubit() : super([]);

  void update(List<GifModel> newList) => emit(newList);
  void read(int offset, String text) async {
    List<GifModel> newList = await GiphyRepo().read(offset, text, state);
    update(newList);
  }
}
