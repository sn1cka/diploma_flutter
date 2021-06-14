import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/api/api_caller.dart';
import 'package:flutter_app/api/tour_model.dart';
import 'package:flutter_app/components/app_bar.dart';
import 'package:flutter_app/components/drawer.dart';
import 'package:flutter_app/components/main_screen_tours_widget.dart';
import 'package:flutter_app/components/search_component.dart';
import 'package:flutter_app/local_models/settings_model.dart';
import 'package:flutter_app/screens/detailed_screen.dart';
import 'package:flutter_app/screens/list_tour_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  var searchList = <Tour>[];

  Future<void> getTours() async {
    apiClient.getAllTours().then((value) {
      setState(() {
        popularTour = value.first;
        actual = value;
      });
    }, onError: (error, stack) {
      print(error);
      debugPrintStack(stackTrace: stack);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Проблемы с подключением к серверу'),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    getTours();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
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
                TransparentAppBar(
                  title: Text(
                    'Привет, ${settings.name}!\nКуда хочешь поехать?',
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: Colors.black,
                    ),
                  ),
                ),

                TourSearchComponent(tourList: List.from(actual)),
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
