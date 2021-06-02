import 'package:flutter/widgets.dart';
import 'package:flutter_app/components/image_with_progress.dart';
import 'package:flutter_app/api/tour_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTile extends StatelessWidget {
  SearchTile(this.tour, {Key? key}) : super(key: key);
  final Tour tour;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(mainAxisSize: MainAxisSize.max, children: [
          Container(
            height: 60.h,
            width: 70.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ProgressiveNetworkImage(
                boxfit: BoxFit.cover,
                url: tour.photo,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tour.name),
                Text(tour.region),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
