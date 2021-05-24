import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/components/app_bar.dart';
import 'package:flutter_app/components/stacked_image_with_text.dart';
import 'package:flutter_app/models/tour_model.dart';
import 'package:flutter_app/screens/detailed_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TourListScreen extends StatelessWidget {
  final List<Tour> tourList;
  final title;

  const TourListScreen({Key? key, required this.tourList, this.title = 'Список Актуальных туров'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TransparentAppBar(),
        Text(title),
        Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: tourList.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.all(16.w),
                      child: InkWell(
                        child: StackedImageWithText(this.tourList[index]),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return DetailedScreen(tour: this.tourList[index]);
                              },
                            ),
                          );
                        },
                      ));
                }))
      ]),
    );
  }
}
