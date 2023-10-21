import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:scroll_list_search/models/gif_model.dart';

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
          height: 30,
          width: 30,
          child: CachedNetworkImage(
            imageUrl: item.url,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        title: Text(item.title),
      ),
    );
  }
}
