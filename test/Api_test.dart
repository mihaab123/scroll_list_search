import 'package:flutter_test/flutter_test.dart';
import 'package:scroll_list_search/api.dart';

void main() {
  test('ApiClass should return list', () async {
    final apiClass = ApiClass();

    var list = await apiClass.request(0, "test");

    expect(list.isNotEmpty, true);
  });
}
