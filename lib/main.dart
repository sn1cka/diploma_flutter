import 'package:flutter/material.dart';
import 'package:flutter_app/screens/main_screen.dart';
import 'package:flutter_app/screens/start_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('MyBox');
  runApp(MyApp());
}

void openNewScreen(Widget widget, context, {bool needReplace = false}) {
  if (needReplace) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => widget,
    ));
  } else
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => widget,
    ));
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
                textTheme: TextTheme(
                  button: TextStyle(fontSize: 17.sp),
                ),
              ),
              home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  void initState() {
    super.initState();
    checkId();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    ));
  }

  void checkId() async {
    await Future.delayed(Duration(milliseconds: 500));
    var box = Hive.box('MyBox');
    if (await box.get('isAuthorized', defaultValue: false)) {
      openNewScreen(MainScreen(), context, needReplace: false);
    } else
      openNewScreen(StartScreen(), context, needReplace: true);
  }

//
// List<String> getTestImages() {
//   return [
//     'https://steamuserimages-a.akamaihd.net/ugc/940586530515504757/CDDE77CB810474E1C07B945E40AE4713141AFD76/',
//     'https://i.pinimg.com/originals/a4/f8/f9/a4f8f91b31d2c63a015ed34ae8c13bbd.jpg',
//     'https://cdn.hovia.com/app/uploads/Green-Tropical-Plant-Wallpaper-Mural-Plain.jpg'
//   ];
// }
//
// void createTestButtons() {
//   Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//     ElevatedButton(
//       onPressed: () => openNewScreen(RegistrationScreen()),
//       child: Text('Registration'),
//     ),
//     ElevatedButton(
//       onPressed: () => openNewScreen(StartScreen()),
//       child: Text('Start screen'),
//     ),
//     ElevatedButton(
//       onPressed: () => openNewScreen(LoginScreen()),
//       child: Text('Login Screen'),
//     ),
//     ElevatedButton(
//         onPressed: () => openNewScreen(DetailedScreen(
//               tour: FakeData.tour,
//             )),
//         child: Text('Detailed')),
//     ElevatedButton(
//       onPressed: () => openNewScreen(MainScreen()),
//       child: Text('MainScreen'),
//     ),
//     ElevatedButton(
//         onPressed: () => openNewScreen(BookTourScreen(
//               FakeData.tour,
//               variant: FakeData.variant,
//             )),
//         child: Text('BookTour')),
//     ElevatedButton(
//         onPressed: () => openNewScreen(
//               CarouselImageShower(
//                 items: getTestImages(),
//               ),
//             ),
//         child: Text('ImageShower')),
//     ElevatedButton(
//         onPressed: () => openNewScreen(
//               TourListScreen(
//                 tourList: FakeData.tourList,
//               ),
//             ),
//         child: Text('TourList')),
//   ]);
// }
}
