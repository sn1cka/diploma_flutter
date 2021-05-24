import 'package:flutter/material.dart';
import 'package:flutter_app/models/tour_model.dart';
import 'package:flutter_app/screens/book_tour_screen.dart';
import 'package:flutter_app/screens/detailed_screen.dart';
import 'package:flutter_app/screens/images_screen.dart';
import 'package:flutter_app/screens/list_tour_screen.dart';
import 'package:flutter_app/screens/login_screen.dart';
import 'package:flutter_app/screens/main_screen.dart';
import 'package:flutter_app/screens/registration_screen.dart';
import 'package:flutter_app/screens/start_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 812),
        builder: () => MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                  primarySwatch: Colors.green,
                  buttonColor: Colors.green,
                  textTheme: TextTheme(button: TextStyle(fontSize: 17.sp))),
              home: SafeArea(child: MyHomePage(title: 'Flutter Demo Home Page')),
            ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      ElevatedButton(
          onPressed: () => openNewScreen(RegistrationScreen()), child: Text('Registration')),
      ElevatedButton(onPressed: () => openNewScreen(StartScreen()), child: Text('Start screen')),
      ElevatedButton(onPressed: () => openNewScreen(LoginScreen()), child: Text('Login Screen')),
      ElevatedButton(
          onPressed: () => openNewScreen(DetailedScreen(tour: Tour())), child: Text('Detailed')),
      ElevatedButton(onPressed: () => openNewScreen(MainScreen()), child: Text('MainScreen')),
      ElevatedButton(
          onPressed: () => openNewScreen(BookTourScreen(Tour())), child: Text('BookTour')),
      ElevatedButton(
          onPressed: () => openNewScreen(CarouselImageShower(items: getTestImages())),
          child: Text('ImageShower')),
      ElevatedButton(
          onPressed: () => openNewScreen(TourListScreen(
                tourList: [Tour(), Tour()],
              )),
          child: Text('TourList')),
    ]);
  }

  void openNewScreen(Widget widget) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => widget,
    ));
  }

  List<String> getTestImages() {
    return [
      'https://steamuserimages-a.akamaihd.net/ugc/940586530515504757/CDDE77CB810474E1C07B945E40AE4713141AFD76/',
      'https://i.pinimg.com/originals/a4/f8/f9/a4f8f91b31d2c63a015ed34ae8c13bbd.jpg',
      'https://cdn.hovia.com/app/uploads/Green-Tropical-Plant-Wallpaper-Mural-Plain.jpg'
    ];
  }
}
