import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/components/app_bar.dart';
import 'package:flutter_app/components/image_with_progress.dart';
import 'package:flutter_app/models/tour_model.dart';
import 'package:flutter_app/screens/images_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookTourScreen extends StatelessWidget {
  const BookTourScreen(this.tour, {Key? key, this.index = 0}) : super(key: key);

  final int index;
  final Tour tour;

  @override
  Widget build(BuildContext context) {
    var variant = tour.variants[index];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TransparentAppBar(),
            Center(
                child: Text(
                  tour.name,
                  style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
                )),
            createInfoLine('Организатор: ${variant.company.name}'),
            createInfoLine('Уровень похода: ${variant.details.difficulty}'),
            createInfoLine('Стоимость: ${variant.coast}'),
            createInfoLine('Выезд: ${variant.details.outTime}'),
            createInfoLine('Приезд: ${variant.details.backTime}'),
            createInfoLine('${variant.details.neededItems}'),
            createInfoLine('Отзывы'),
            CarouselSlider.builder(
              options: CarouselOptions(viewportFraction: 1, disableCenter: true),
              itemCount: variant.company.companyFeed.length,
              itemBuilder: (context, index, realIndex) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.w),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.w),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return CarouselImageShower(
                                    items: [variant.company.companyFeed[index].photo],
                                    tag: 'Tag$index',
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            width: (1 / 3).sw,
                            height: (3 / 5).sh,
                            child: Hero(
                              tag: 'MainImage',
                              child: ProgressiveNetworkImage(
                                url: variant.company.companyFeed[index].photo,
                                boxfit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              variant.company.companyFeed[index].feed,
                              style: TextStyle(fontSize: 18.sp),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                variant.company.companyFeed[index].name,
                                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ) // Text(variant.company.companyFeed[0].name)
                  ],
                );
              },
            ),
            Center(
              child: Container(
                width: 1.sw,
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Column(children: [],);
                        },
                      );
                    },
                    child: Text('Написать'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget createContactButton(Icon icon, String title, String? subtitle, Function onTap) {
    return TextButton(onPressed: () {
    },
      child: Column(
        children: [
          Row(children: [
            icon, Text(title)
          ],),
          Text(subtitle??'')
        ],
      ),);
  }

  Widget createInfoLine(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Text(
        text,
        style: TextStyle(fontSize: 20.sp),
      ),
    );
  }
}
