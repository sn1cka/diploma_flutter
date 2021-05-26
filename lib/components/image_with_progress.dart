import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProgressiveNetworkImage extends StatelessWidget {
  final String url;

  final BoxFit? boxfit;

  const ProgressiveNetworkImage({Key? key, required this.url, this.boxfit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: url,
        fit: boxfit,
        progressIndicatorBuilder: (context, child, loadingProgress) {
          return Center(child:loadingProgress.progress != null? CircularProgressIndicator(value: loadingProgress.progress): Container());
        },
        errorWidget: (context, error, stackTrace) {
          return Center(child: Icon(Icons.error));
        });
  }
}
