import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/components/app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselImageShower extends StatelessWidget {
  const CarouselImageShower({Key? key, required this.items, initialPage = 0}) : super(key: key);
  static const imageTag = 'ShowImage';
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [Hero(tag: imageTag, child: getImageWidget(items.first))];
    if (items.length > 1) {
      for (int i = 1; i < items.length; i++) {
        widgets.add(getImageWidget(items[i]));
      }
    }
    return Scaffold(
      body: Column(
        children: [
          TransparentAppBar(),
          CarouselSlider(
              items: widgets,
              options: CarouselOptions(
                  height: 0.8.sh,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  disableCenter: true)),
        ],
      ),
    );
  }

  Widget getImageWidget(url) {
    return Image.network(url, loadingBuilder: (context, child, loadingProgress) {
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
