import 'package:flutter/material.dart';
import 'package:scroll_list_search/models/gif_model.dart';
import 'package:scroll_list_search/widgets/giphy_image.dart';

class ListItem extends StatelessWidget {
  final GifModel item;
  const ListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                blurRadius: 2,
                spreadRadius: 3,
                color: Theme.of(context).colorScheme.inversePrimary)
          ],
          border:
              Border.all(color: Theme.of(context).colorScheme.inversePrimary)),
      child: ListTile(
        leading: SizedBox(
          height: 20,
          width: 20,
          child: GiphyImage(
            url: item.url,
            height: 20,
            width: 20,
          ),
        ),
        title: Text(item.title),
      ),
    );
  }
}
