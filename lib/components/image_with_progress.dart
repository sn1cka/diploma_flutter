import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProgressiveNetworkImage extends StatelessWidget {
  final String url;

  final BoxFit? boxfit;

  const ProgressiveNetworkImage({Key? key, required this.url, this.boxfit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(url, fit: boxfit, loadingBuilder: (context, child, loadingProgress) {
      if (loadingProgress == null) return child;
      return Center(
          child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                  : null));
    }, errorBuilder: (context, error, stackTrace) {
      return Center(child: Icon(Icons.error));
    });
  }
}
