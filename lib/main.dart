import 'package:flutter/material.dart';
import 'package:flutter_app/screens/main_screen.dart';
import 'package:flutter_app/screens/start_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //todo add own cabinet and auth
  await Hive.initFlutter();
  await Hive.openBox('MyBox');
  runApp(MyApp());
}

void openNewScreen(Widget widget, context, {bool needReplace = false}) {
  if (needReplace) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
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
      openNewScreen(MainScreen(), context, needReplace: true);
    } else
      openNewScreen(StartScreen(), context, needReplace: true);
  }

}
