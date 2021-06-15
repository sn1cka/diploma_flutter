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
    List<Tour> tourList = List.from(widget.tourList);
    var text = searchTextController.text;
    if (text.isNotEmpty && text.length > 2) {
      tourList = tourList
          .where((e) => (e.name.toLowerCase().contains(text.toLowerCase()) ||
              e.region.toLowerCase().contains(text.toLowerCase())))
          .toList();
    }
    if (needPhotographer) {
      List<Tour> newList = [];
      List<Tour> mList = List.from(tourList);
      mList.forEach((element) {
        element.variants =
            element.variants.where((element) => element.photographer).toList();
        if (element.variants.length > 0) {
          newList.add(element);
        }
      });
      tourList = newList;
    }
    if (coastMin != null) {
      List<Tour> newList = [];
      List<Tour> mList = List.from(tourList);
      mList.forEach((element) {
        element.variants = element.variants
            .where((element) => element.coast >= coastMin!)
            .toList();
        if (element.variants.length > 0) {
          newList.add(element);
        }
      });
      tourList = newList;
    }

    if (coastMax != null) {
      List<Tour> newList = [];
      List<Tour> mList = List.from(tourList);
      mList.forEach((element) {
        element.variants = element.variants
            .where((element) => element.coast <= coastMax!)
            .toList();
        if (element.variants.length > 0) {
          newList.add(element);
        }
      });
      tourList = newList;
    }

    if (coastMax != null) {
      List<Tour> newList = [];
      List<Tour> mList = List.from(tourList);
      mList.forEach((element) {
        element.variants = element.variants
            .where((element) => element.coast <= coastMax!)
            .toList();
        if (element.variants.length > 0) {
          newList.add(element);
        }
      });
      tourList = newList;
    }
    if (maxHeight != null) {
      List<Tour> newList = [];
      List<Tour> mList = List.from(tourList);
      mList.forEach((element) {
        element.variants = element.variants
            .where((element) => element.maxHeight <= maxHeight!)
            .toList();
        if (element.variants.length > 0) {
          newList.add(element);
        }
      });
      tourList = newList;
    }

    if (daysCount != null) {
      List<Tour> newList = [];
      List<Tour> mList = List.from(tourList);
      mList.forEach((element) {
        element.variants = element.variants
            .where((element) => element.daysCount == daysCount!)
            .toList();
        if (element.variants.length > 0) {
          newList.add(element);
        }
      });
      tourList = newList;
    }

    setState(() {
      searchList = List.from(tourList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
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
        !showFilters
            ? Container()
            : Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color.fromARGB(12, 118, 118, 128)),
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      children: [
                        CheckboxListTile(
                          contentPadding: EdgeInsets.all(0),
                          selected: needPhotographer,
                          title: Text('Фотограф в туре'),
                          value: needPhotographer,
                          onChanged: (value) {
                            needPhotographer = value!;
                            checkConditions();
                          },
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Цена: '),
                            Container(
                              width: 100.w,
                              child: TextField(
                                controller: coastMinTextController,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    hintText: 'мин.', alignLabelWithHint: true),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  coastMin = int.tryParse(value);
                                  checkConditions();
                                },
                              ),
                            ),
                            SizedBox(
                              width: 40.w,
                            ),
                            Container(
                              width: 100.w,
                              child: TextField(
                                controller: coastMaxTextController,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    hintText: 'макс.',
                                    alignLabelWithHint: true),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  coastMax = int.tryParse(value);
                                  checkConditions();
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Количество дней: "),
                            Container(
                              width: 50.w,
                              child: TextField(
                                controller: daysCountTextController,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    hintText: '*', alignLabelWithHint: true),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  daysCount = int.tryParse(value);
                                  checkConditions();
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Макс. длина пешего пути (м): "),
                            Container(
                              width: 50.w,
                              child: TextField(
                                controller: maxPathLengthTextController,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    hintText: '*', alignLabelWithHint: true),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  maxPathLength = int.tryParse(value);
                                  checkConditions();
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Макс. высота \n над уровнем моря(м): "),
                            Container(
                              width: 50.w,
                              child: TextField(
                                controller: maxHeightTextController,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    hintText: '*', alignLabelWithHint: true),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  maxHeight = int.tryParse(value);
                                  checkConditions();
                                },
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () async{
                              date = (await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate:
                                      DateTime.now().add(Duration(days: 60))));
                              setState(() {

                              });
                            },
                            child: Text('Дата: $date '))
                      ],
                    ),
                  ),
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
      ]),
    );
  }
}
