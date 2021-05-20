import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/image_with_progress.dart';
import 'package:flutter_app/models/tour_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreenTourWidget extends StatelessWidget {
  const MainScreenTourWidget({Key? key, required this.tourList}) : super(key: key);
  final List<Tour> tourList;

  @override
  Widget build(BuildContext context) {
    bool isInfiniteScrollEnabled = tourList.length != 1;

    return  CarouselSlider(
      options: CarouselOptions(
          autoPlay: true,
          viewportFraction: 1.2,
          enlargeCenterPage: false,
          enableInfiniteScroll: isInfiniteScrollEnabled),
      items: tourList.map((e) {
        return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(children: [
              Container(
                  height: 270.h,
                  width: 1.sw-32.w,
                  color: Colors.grey,
                  child: ProgressiveNetworkImage(
                    url: e.photoUrl,
                    boxfit: BoxFit.cover,
                  )),
              Positioned(
                bottom: 0,
                child: Container(
                    width: 1.sw,
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.name,
                              style: TextStyle(color: Colors.white, fontSize: 20.sp),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              e.region,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.white, fontSize: 20.sp),
                            ),
                          ],
                        ))),
              )
            ]));
      }).toList(),
    );
  }
}
