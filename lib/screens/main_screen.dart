import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/components/main_screen_tours_widget.dart';
import 'package:flutter_app/components/search_tile.dart';
import 'package:flutter_app/api/api_caller.dart';
import 'package:flutter_app/local_models/settings_model.dart';
import 'package:flutter_app/api/tour_model.dart';
import 'package:flutter_app/screens/detailed_screen.dart';
import 'package:flutter_app/screens/list_tour_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

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
  var searchList = <Tour>[];
  var textContoller = TextEditingController();

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
  void initState() {
    // TODO: implement initState
    super.initState();
    getTours();
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
                // TransparentAppBar(),
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
                  padding: EdgeInsets.all(16.w),
                  child: CupertinoSearchTextField(
                      controller: textContoller,
                      onChanged: (value) {
                        setState(() {
                          searchList = actual
                              .where((e) => (value.isNotEmpty &&
                                  value.length > 2 &&
                                  (e.name
                                          .toLowerCase()
                                          .contains(value.toLowerCase()) ||
                                      e.region
                                          .toLowerCase()
                                          .contains(value.toLowerCase()))))
                              .toList();
                        });
                      }),
                ),
                Column(
                  children: searchList
                      .map(
                        (e) => InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return DetailedScreen(tour: e);
                              }));
                            },
                            child: SearchTile(e)),
                      )
                      .toList(),
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
