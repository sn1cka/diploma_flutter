import 'package:flutter/material.dart';
import 'package:flutter_app/models/tour_model.dart';
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
          AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                model.name,
                style: TextStyle(
                  fontSize: 34.sp,
                ),
              )),
          Padding(
              padding: EdgeInsets.all(20.w),
              child: Image.network(
                model.photoUrl,
                width: 1.sw,
              )),
          model.variants.isEmpty
              ? Text('В настоящее время туры по этому направлению недоступны')
              : createTourVariants(model.variants)
        ])));
  }

  Table createTourVariants(List<TourVariant> variants) {
    var tableTitle = TableRow(children: [
      Text('Орагнизатор'),
      Text('Стоимость'),
      Text('Дата')
    ]);
    List<TableRow> rows = [tableTitle];
    for (var variant in variants) {
      rows.add(TableRow(children: [
        Text(variant.organization),
        Text(variant.coast.toString()),
        Text(variant.date)
      ]));
    }
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: rows,
    );
  }
}
