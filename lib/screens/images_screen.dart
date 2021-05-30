import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/components/app_bar.dart';
import 'package:flutter_app/components/image_with_progress.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselImageShower extends StatefulWidget {
  const CarouselImageShower(
      {Key? key,
      required this.items,
      this.initialPage = 0,
      this.tag = 'ImageShower'})
      : super(key: key);
  final initialPage;
  final tag;
  final List<String> items;

  @override
  _CarouselImageShowerState createState() => _CarouselImageShowerState();
}

class _CarouselImageShowerState extends State<CarouselImageShower> {
  var _currentIndex = 0;

  @override
  void initState() {
    _currentIndex = widget.initialPage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    for (int i = 0; i < widget.items.length; i++) {
      if (i == _currentIndex)
        widgets.add(
          Hero(
            tag: widget.tag,
            child: ProgressiveNetworkImage(url: widget.items[i]),
          ),
        );
      else
        widgets.add(ProgressiveNetworkImage(url: widget.items[i]));
    }
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TransparentAppBar(),
            CarouselSlider(
                items: widgets,
                options: CarouselOptions(
                  height: 0.8.sh,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  initialPage: _currentIndex,
                  disableCenter: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                )),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.items.map((url) {
                  int index = widget.items.indexOf(url);
                  return Container(
                      width: _currentIndex == index ? 10.w : 8.w,
                      height: _currentIndex == index ? 10.w : 8.w,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? Colors.lightGreen
                              : Colors.grey));
                }).toList())
          ],
        ),
      ),
    );
  }
}
