import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/api/tour_model.dart';
import 'package:flutter_app/components/search_tile.dart';
import 'package:flutter_app/screens/detailed_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TourSearchComponent extends StatefulWidget {
  // TODO add onwillpop and flags
  //todo add datepicker
  const TourSearchComponent({Key? key, required this.tourList})
      : super(key: key);

  final List<Tour> tourList;

  @override
  _TourSearchComponentState createState() => _TourSearchComponentState();
}

class _TourSearchComponentState extends State<TourSearchComponent> {
  final searchTextController = TextEditingController();
  final coastMaxTextController = TextEditingController();
  final coastMinTextController = TextEditingController();
  final maxPathLengthTextController = TextEditingController();
  final daysCountTextController = TextEditingController();
  final maxHeightTextController = TextEditingController();

  bool showFilters = false;
  bool needPhotographer = false;
  int? coastMin;
  int? coastMax;
  int? maxHeight;
  int? maxPathLength;
  int? daysCount;
  DateTime? date;
  List<Tour> searchList = [];

  void closeAndClearSearch() {
    setState(() {
      coastMin = null;
      coastMax = null;
      maxHeight = null;
      maxPathLength = null;
      daysCount = null;
      date = null;
      needPhotographer = false;
      searchTextController.clear();
      searchList = [];
    });
  }

  checkConditions() {
    var tourList = <Tour>[];
    tourList.addAll(widget.tourList);
    var text = searchTextController.text;
    if (text.isNotEmpty && text.length > 2) {
      tourList = tourList.where((e) =>
          (e.name.toLowerCase().contains(text.toLowerCase()) ||
              e.region.toLowerCase().contains(text.toLowerCase()))).toList();
    }
    if (needPhotographer) {
      List<Tour> newList = [];
      tourList.forEach((element) {
        var newElement = element;
        newElement.variants = newElement.variants
            .where((element) => element.photographer)
            .toList();
        if (newElement.variants.isNotEmpty) {
          newList.add(newElement);
        }
      });
      tourList = newList;
    }
    if (coastMin != null) {
      List<Tour> newList = [];
      tourList.forEach((element) {
        Tour newElement = element;
        newElement.variants = newElement.variants
            .where((element) => element.coast >= coastMin!)
            .toList();
        if (newElement.variants.isNotEmpty) {
          newList.add(newElement);
        }
      });
      tourList = newList;
    }
    if (coastMax != null) {
      List<Tour> newList = [];
      tourList.forEach((element) {
        var newElement = element;
        newElement.variants = newElement.variants
            .where((element) => element.coast <= coastMax!)
            .toList();
        if (newElement.variants.isNotEmpty) {
          newList.add(newElement);
        }
        tourList = newList;
      });
    }
    if (daysCount != null) {
      List<Tour> newList = [];
      tourList.forEach((element) {
        var newElement = element;
        newElement.variants = newElement.variants
            .where((element) => element.daysCount == daysCount!)
            .toList();
        if (newElement.variants.isNotEmpty) {
          newList.add(newElement);
        }
        tourList = newList;
      });
    }
    if (maxPathLength != null) {
      List<Tour> newList = [];
      tourList.forEach((element) {
        var newElement = element;
        newElement.variants = newElement.variants
            .where((element) => element.pathLength == maxPathLength!)
            .toList();
        if (newElement.variants.isNotEmpty) {
          newList.add(newElement);
        }
        tourList = newList;
      });
    }
    if (daysCount != null) {
      List<Tour> newList = [];
      tourList.forEach((element) {
        var newElement = Tour.fromJson(element.toJson());
        newElement.variants = newElement.variants
            .where((element) => element.daysCount == daysCount!)
            .toList();
        if (newElement.variants.isNotEmpty) {
          newList.add(newElement);
        }
        tourList = newList;
      });
    }
    setState(() {
      searchList = tourList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.all(16.w),
        child: CupertinoSearchTextField(
            onSuffixTap: () {
              setState(() {
                showFilters = !showFilters;
              });
            },
            suffixMode: OverlayVisibilityMode.always,
            suffixIcon: Icon(Icons.filter_alt_outlined),
            controller: searchTextController,
            onChanged: (value) {
              checkConditions();
            }),
      ),
      Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: showFilters
              ? [
                  CheckboxListTile(
                    title: Text('Фотограф в туре'),
                    value: needPhotographer,
                    onChanged: (value) {
                      needPhotographer = value!;
                      checkConditions();
                    },
                  ),
                  TextField(
                    controller: coastMinTextController,
                    onChanged: (value) {
                      coastMin = int.tryParse(value);
                      checkConditions();
                    },
                  )
                ]
              : [],
        ),
      ),
      Column(
        children: searchList.isNotEmpty
            ? [
                Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 4.h),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                          'Всего найдено туров по запросу: ${searchList.length} '),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: TextButton(
                            onPressed: () => closeAndClearSearch(),
                            child: Icon(Icons.close_rounded)),
                      )
                    ],
                  ),
                ),
                ...searchList
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
                    .toList()
              ]
            : [],
      ),
    ]);
  }
}
