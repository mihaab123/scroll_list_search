import 'package:flutter_test/flutter_test.dart';
import 'package:scroll_list_search/repositories/giphy_repo.dart';

void main() {
  test('repo should return list', () async {
    final apiClass = GiphyRepo();

    var list = await apiClass.read(0, "test", []);

    expect(list.isNotEmpty, true);
  });
}
