import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app/components/app_bar.dart';
import 'package:flutter_app/models/tour_model.dart';
import 'package:flutter_app/screens/book_tour_screen.dart';
import 'package:flutter_app/screens/images_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailedScreen extends StatelessWidget {
  const DetailedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailedWidget(),
    );
  }
}

class DetailedWidget extends StatefulWidget {
  const DetailedWidget({Key? key}) : super(key: key);

  @override
  _DetailedWidgetState createState() => _DetailedWidgetState();
}

class _DetailedWidgetState extends State<DetailedWidget> {
  Tour model = Tour();
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {},
        child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TransparentAppBar(),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              child: Text(
                model.name,
                style: TextStyle(
                  fontSize: 34.sp,
                ),
              )),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.w),
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CarouselImageShower(items: [model.photoUrl]),
                    ));
                  },
                  child: Hero(
                      tag: CarouselImageShower.imageTag,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            model.photoUrl,
                            height: 250.h,
                            width: 1.sw,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                  height: 250.h,
                                  width: 1.sw,
                                  child: Center(
                                      child: CircularProgressIndicator(
                                          value: loadingProgress.expectedTotalBytes != null
                                              ? loadingProgress.cumulativeBytesLoaded /
                                                  loadingProgress.expectedTotalBytes!
                                              : null)));
                            },
                          ))))),
          model.variants.isEmpty
              ? Text('В настоящее время туры по этому направлению недоступны')
              : createTourVariants(model.variants),
          model.additionalPhotosUrl.isEmpty
              ? Container()
              : Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: CarouselSlider(
                      items: getListOfAdditionalImages(model.additionalPhotosUrl),
                      options: CarouselOptions(
                          height: 220.h, viewportFraction: 0.6, enlargeCenterPage: true)))
        ])));
  }

  List<Widget> getListOfAdditionalImages(List<String> list) {
    return list
        .map((elementUrl) => Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  elementUrl,
                  fit: BoxFit.contain,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                        child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null));
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Center(child: Icon(Icons.error));
                  },
                ))))
        .toList();
  }

  Widget createTourVariants(List<TourVariant> variants) {
    var dataTitle = [
      DataColumn(label: Text('Орагнизатор')),
      DataColumn(label: Text('Стоимость')),
      DataColumn(label: Center(child: Text('Дата'))),
    ];

    List<DataRow> rows = [];
    for (var variant in variants) {
      rows.add(DataRow(
        cells: [
          DataCell(Text(variant.organization)),
          DataCell(Center(child: Text(variant.coast.toString()))),
          DataCell(Text(variant.date))
        ],
        onSelectChanged: (value) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => BookTourScreen(variant)));
        },
      ));
    }
    return FittedBox(
        child: DataTable(
      showCheckboxColumn: false,
      columns: dataTitle,
      rows: rows,
    ));
  }
}
