import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/stacked_image_with_text.dart';
import 'package:flutter_app/api/tour_model.dart';

class MainScreenTourWidget extends StatelessWidget {
  const MainScreenTourWidget({Key? key, required this.tourList}) : super(key: key);
  final List<Tour> tourList;

  @override
  Widget build(BuildContext context) {
    bool isInfiniteScrollEnabled = tourList.length != 1;

    return CarouselSlider(
      options: CarouselOptions(
          autoPlay: true,
          viewportFraction: 1.2,
          enlargeCenterPage: false,
          enableInfiniteScroll: isInfiniteScrollEnabled),
      items: tourList.map((e) {
        return ClipRRect(borderRadius: BorderRadius.circular(8), child: StackedImageWithText(e));
      }).toList(),
    );
  }
}
