import 'package:flutter/material.dart';

class DetailedScreen extends StatelessWidget {
  const DetailedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Мдааааааааа')),
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
  var difficulty = 'Средний';
  var coast = 0;
  var leaveTime = '06:00';
  var returningTime = '20:00';
  var neededItems =
      'С собой необходимо иметь: пупу, лупу, бухгалтерию и все остальное';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Padding(
            padding: EdgeInsets.all(20),
            child: Text('Уровень похода: $difficulty')),
        Padding(
            padding: EdgeInsets.all(20), child: Text('Стоимость: $coast сом')),
        Padding(padding: EdgeInsets.all(20), child: Text('Выезд: $leaveTime')),
        Padding(
            padding: EdgeInsets.all(20), child: Text('Выезд: $returningTime')),
        Padding(padding: EdgeInsets.all(20), child: Text(neededItems)),
        Padding(padding: EdgeInsets.all(20), child: Text('Отзывы')),
        Padding(
            padding: EdgeInsets.all(20),
            child: Text(
                'Lorem Ipsum Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..')),
        Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(onPressed: () {}, child: Text('Написать'))),
      ]),
    );
  }
}
