import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app/components/app_bar.dart';
import 'package:flutter_app/components/image_with_progress.dart';
import 'package:flutter_app/models/tour_model.dart';
import 'package:flutter_app/screens/book_tour_screen.dart';
import 'package:flutter_app/screens/images_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailedScreen extends StatelessWidget {
  const DetailedScreen({Key? key, required this.tour}) : super(key: key);
  final Tour tour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailedWidget(tour),
    );
  }
}

class DetailedWidget extends StatefulWidget {
  const DetailedWidget(this.tour, {Key? key}) : super(key: key);
  final Tour tour;

  @override
  _DetailedWidgetState createState() => _DetailedWidgetState();
}

class _DetailedWidgetState extends State<DetailedWidget> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var model = widget.tour;
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
                      builder: (context) => CarouselImageShower(
                        items: [model.photoUrl],
                        tag: 'MainImage',
                      ),
                    ));
                  },
                  child: Hero(
                      tag: 'MainImage',
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                              height: 250.h,
                              width: 1.sw,
                              child: ProgressiveNetworkImage(
                                url: model.photoUrl,
                                boxfit: BoxFit.cover,
                              )))))),
          model.variants.isEmpty
              ? Text('В настоящее время туры по этому направлению недоступны')
              : createTourVariants(model.variants),
          model.additionalPhotosUrl.isEmpty
              ? Container()
              : Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  child: CarouselSlider(
                      items: getListOfAdditionalImages(model.additionalPhotosUrl),
                      options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                          enableInfiniteScroll: false,
                          height: 220.h,
                          viewportFraction: 0.6,
                          disableCenter: false,
                          enlargeCenterPage: true))),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: model.additionalPhotosUrl.map((url) {
                int index = model.additionalPhotosUrl.indexOf(url);
                return Container(
                    width: _currentIndex == index ? 10.w : 8.w,
                    height: _currentIndex == index ? 10.w : 8.w,
                    margin: EdgeInsets.symmetric(vertical: 10.w, horizontal: 2.w),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index ? Colors.lightGreen : Colors.grey));
              }).toList())
        ])));
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
          DataCell(Text(variant.company.name)),
          DataCell(Center(child: Text(variant.coast.toString()))),
          DataCell(Text(variant.date))
        ],
        onSelectChanged: (value) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => BookTourScreen(Tour())));
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

  List<Widget> getListOfAdditionalImages(List<String> itemList) {
    return itemList.map((elementUrl) {
      var index = itemList.indexOf(elementUrl);
      return Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: InkWell(
            child: Hero(
                tag: 'MutlipleImages$index',
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: ProgressiveNetworkImage(
                      url: elementUrl,
                      boxfit: BoxFit.cover,
                    ))),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CarouselImageShower(
                  tag: 'MutlipleImages$index',
                  items: itemList,
                  initialPage: index,
                ),
              ));
            },
          ));
    }).toList();
  }
}
