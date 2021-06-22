import 'package:flutter/material.dart';
import 'package:flutter_app/api/company_model.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/screens/feed_screen.dart';
import 'package:flutter_app/screens/my_page.dart';
import 'package:flutter_app/screens/registration_screen.dart';
import 'package:flutter_app/screens/start_screen.dart';
import 'package:flutter_app/screens/tour_suggestion_screen.dart';
import 'package:hive/hive.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key, required this.companyList}) : super(key: key);
  List<Company> companyList;

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
              openNewScreen(SuggestTourScreen(), context);
            },
          ),
          ListTile(
            title: Text('Отзывы о компаниях'),
            onTap: () {
              Navigator.pop(context);
              openNewScreen(CompaniesScreen(companyList: companyList), context);
            },
          ),
          ListTile(
            title: Text('Личный кабинет'),
            onTap: () {
              Navigator.pop(context);
              openNewScreen(MyOwnPage(), context);
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
