import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:scroll_list_search/api.dart';

/// Loads and renders a Giphy image.
class GiphyImage extends StatefulWidget {
  final String? url;
  final Widget? placeholder;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final bool showGiphyAttribution;

  /// Loads an image from given url.
  const GiphyImage(
      {super.key,
      this.url,
      this.placeholder,
      this.width,
      this.height,
      this.fit,
      this.showGiphyAttribution = true});

  @override
  State<GiphyImage> createState() => _GiphyImageState();
}

class _GiphyImageState extends State<GiphyImage> {
  late Future<Uint8List?> _loadImage;

  @override
  void initState() {
    _loadImage = ApiClass().requestImage(widget.url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: _loadImage,
      builder: (BuildContext context, AsyncSnapshot<Uint8List?> snapshot) {
        if (snapshot.hasData) {
          final image = Image.memory(snapshot.data!,
              width: widget.width, height: widget.height, fit: widget.fit);

          return image;
        }
        return widget.placeholder ??
            const Center(child: CircularProgressIndicator());
      });
}
