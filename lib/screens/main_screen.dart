import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/components/app_bar.dart';
import 'package:flutter_app/components/main_screen_tours_widget.dart';
import 'package:flutter_app/models/settings_model.dart';
import 'package:flutter_app/models/tour_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var settings = SettingsModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TransparentAppBar(),
      Padding(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 4.h),
          child: Text(
            'Привет, ${settings.name}!',
            style: TextStyle(
              fontSize: 24.sp,
            ),
          )),
      Padding(
          padding: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 4.h),
          child: Text(
            'Куда хочешь поехать?',
            style: TextStyle(fontSize: 15.sp),
          )),
      Padding(
          padding: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 4.h),
          child: Text(
            'Актуальные',
            style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
          )),
      MainScreenTourWidget(tourList: [
        Tour(),
        Tour(),
        Tour(),
        Tour(),
        Tour(),
      ]),
              Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.h),
                  child: Text(
                    'Популярное направление',
                    style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
                  )),
      MainScreenTourWidget(tourList: [Tour()])
    ])));
  }
}
