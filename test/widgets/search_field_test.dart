import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scroll_list_search/widgets/search_field.dart';

void main() {
  testWidgets('search field ...', (tester) async {
    final TextEditingController contoller = TextEditingController();
    contoller.text = "test";
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
          body: SearchField(
        controller: contoller,
        onChanged: (value) {},
      )),
    ));

    expect(find.text('test'), findsOneWidget);
  });
}
