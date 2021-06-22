import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/api/api_caller.dart';
import 'package:flutter_app/components/app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class MyOwnPage extends StatefulWidget {
  const MyOwnPage({Key? key}) : super(key: key);

  @override
  _MyOwnPageState createState() => _MyOwnPageState();
}

class _MyOwnPageState extends State<MyOwnPage> {
  File? image;
  var name = '';
  var login = '';
  var isLoading = false;
  late RestClient apicaller;
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  void getData() {
    var logger = Logger();
    apicaller.getUser().then((value) {
      setState(() {
        name = value.first_name!;
        login = value.username!;
      });
      logger.i(value.toJson());
    }, onError: (e, s) {
      logger.e(e);
      logger.e(s);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var dio = Dio();

    var token = Hive.box('MyBox').get('token');
    print(token);
    dio.options.headers["Authorization"] = 'Bearer $token';
    apicaller = RestClient(dio);
    getImagePath().then((value) => image = File(value));
    getData();
  }

  Future<String> getImagePath() async {
    Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory(); // 1
    String appDocumentsPath = appDocumentsDirectory.path;
    return '$appDocumentsPath/Me.jpg';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: () async {
          getData();
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              TransparentAppBar(),
              Padding(
                padding: EdgeInsets.all(16.w),
                child: Text(
                  'Личный кабинет',
                  style: TextStyle(
                    fontSize: 34.sp,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  print('AAA');

                  PickedFile? pickedFile = await ImagePicker().getImage(
                    source: ImageSource.gallery,
                    maxWidth: 1800,
                    maxHeight: 1800,
                  );
                  print('aaaaaa');
                  print(pickedFile == null);
                  if (pickedFile != null) {
                    File imageFile = File(pickedFile.path);
                    print(imageFile);
                    var filePath = await getImagePath();
                    await File(imageFile.path).copy(filePath);

                    setState(() {
                      image = File(filePath);
                      print(image);
                    });
                  }
                },
                child: image == null
                    ? Text('выберите фотографию')
                    : Container(
                        height: 300.h,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.file(image!),
                        )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Имя: $name'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Логин: $login'),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
