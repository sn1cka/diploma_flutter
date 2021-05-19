import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/components/app_bar.dart';
import 'package:flutter_app/models/tour_model.dart';

class BookTourScreen extends StatelessWidget {
  const BookTourScreen(this.tour, {Key? key}) : super(key: key);
  final TourVariant tour;

  @override
  Widget build(BuildContext context) {
    print(this.tour.details);
    return Scaffold(
      body: Column(
        children: [
          TransparentAppBar(),
        ],
      ),
    );
  }
}
