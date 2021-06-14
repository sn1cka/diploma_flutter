import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/screens/registration_screen.dart';
import 'package:flutter_app/screens/start_screen.dart';
import 'package:hive/hive.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Text('Discover Kyrgyzstan'),
          ),
          ListTile(
            title: Text('Предложить тур'),
            onTap: () {
              Navigator.pop(context);
              openNewScreen(RegistrationScreen(), context);
            },
          ),
          ListTile(
            title: Text('Отзывы о компаниях'),
            onTap: () {
              Navigator.pop(context);
              openNewScreen(RegistrationScreen(), context);
            },
          ),
          ListTile(
            title: Text('Личный кабинет'),
            onTap: () {
              Navigator.pop(context);
              openNewScreen(RegistrationScreen(), context);
            },
          ),
          ListTile(
            title: Text('Выход'),
            onTap: () {
              Hive.deleteBoxFromDisk('MyBox');
              openNewScreen(StartScreen(), context, needReplace: true);
            },
          )
        ],
      ),
    );
  }
}
