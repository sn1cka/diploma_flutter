import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/models/api_caller.dart';
import 'package:flutter_app/models/tour_model.dart';
import 'package:flutter_app/components/app_bar.dart';
import 'package:flutter_app/components/main_screen_tours_widget.dart';
import 'package:flutter_app/models/settings_model.dart';
import 'package:flutter_app/screens/detailed_screen.dart';
import 'package:flutter_app/screens/list_tour_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var settings = SettingsModel();
  List<Tour> actual = [];
  Tour? popularTour;
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  var apiClient = RestClient(Dio());
  var logger = Logger();

  Future<void> getTours() async {
    apiClient.getAllTours().then((value) {
      setState(() {
        popularTour = value.first;
        actual = value;
      });
    }, onError: (error) {
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Проблемы с подключением к серверу'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          key: refreshKey,
          onRefresh: () async {
            getTours();
            refreshKey.currentState!.show(atTop: false);
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
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
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.bold),
                    )),
                InkWell(
                    child: MainScreenTourWidget(tourList: actual),
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return TourListScreen(
                            tourList: actual, title: 'Актуальные туры');
                      }));
                    }),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.h),
                  child: Text(
                    'Популярное направление',
                    style:
                        TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                popularTour != null
                    ? InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return DetailedScreen(tour: popularTour!);
                          }));
                        },
                        child: MainScreenTourWidget(tourList: [popularTour!]),
                      )
                    : SizedBox(
                        height: 20,
                      ),
                SizedBox(
                  height: 16.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
