import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String value) onChanged;
  const SearchField(
      {super.key, required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
          controller: controller,
          onChanged: (value) {
            onChanged(value);
          },
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              prefixIcon: const Icon(Icons.search),
              hintText: "Enter search text",
              border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.blueAccent, width: 32.0),
                  borderRadius: BorderRadius.circular(25.0)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      width: 32.0),
                  borderRadius: BorderRadius.circular(25.0)))),
    );
  }
}
