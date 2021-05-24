import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/components/app_bar.dart';
import 'package:flutter_app/components/main_screen_tours_widget.dart';
import 'package:flutter_app/models/settings_model.dart';
import 'package:flutter_app/models/tour_model.dart';
import 'package:flutter_app/screens/detailed_screen.dart';
import 'package:flutter_app/screens/list_tour_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var settings = SettingsModel();
  var actual = [
    Tour(),
    Tour(),
    Tour(),
    Tour(),
    Tour(),
  ];
  var popularTour = Tour();

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
      FloatingSearchAppBar(
        hint: 'Поиск',
        body: Container(),
        automaticallyImplyBackButton: false,

      ),
      Padding(
          padding: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 4.h),
          child: Text(
            'Актуальные',
            style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
          )),
      InkWell(
          child: MainScreenTourWidget(tourList: actual),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return TourListScreen(tourList: actual, title: 'Актуальные туры');
            }));
          }),
      Padding(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.h),
          child: Text(
            'Популярное направление',
            style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
          )),
      InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return DetailedScreen(tour: popularTour);
          }));
        },
        child: MainScreenTourWidget(tourList: [popularTour]),
      ),
      SizedBox(
        height: 16.h,
      )
    ])));
  }
}
