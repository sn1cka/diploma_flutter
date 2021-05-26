import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/api/tour_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'image_with_progress.dart';

class StackedImageWithText extends StatelessWidget {
  const StackedImageWithText(this.element, {Key? key}) : super(key: key);
  final Tour element;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(children: [
        Container(
            height: 270.h,
            width: 1.sw - 32.w,
            child: ProgressiveNetworkImage(
              url: element.photoUrl,
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
                    element.name,
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    element.region,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
