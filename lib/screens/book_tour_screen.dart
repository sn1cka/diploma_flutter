import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/api/api_caller.dart';
import 'package:flutter_app/api/company_model.dart';
import 'package:flutter_app/api/tour_model.dart';
import 'package:flutter_app/components/app_bar.dart';
import 'package:flutter_app/components/image_with_progress.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import 'images_screen.dart';

class BookTourScreen extends StatefulWidget {
  const BookTourScreen(this.tour, {Key? key, required this.variant}) : super(key: key);

  final TourVariant variant;
  final Tour tour;

  @override
  _BookTourScreenState createState() => _BookTourScreenState();
}

class _BookTourScreenState extends State<BookTourScreen> {
  var feeds = <CompanyFeed> [];
  var isLoading = false;
  final apiClient = RestClient(Dio());

  Future<void> getFeeds() async {
    apiClient.getCompanyFeedsById(widget.variant.company.id).then((value) {
      setState(() {
        feeds = value;
      });
    }, onError: (error, stack) {
      print(error);
      debugPrintStack(stackTrace: stack);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Проблемы с подключением к серверу'),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    getFeeds();
  }

  @override
  Widget build(BuildContext context) {
    var variant = widget.variant;

    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            await getFeeds();
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TransparentAppBar(),
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Center(
                      child: Text(
                    widget.tour.name,
                    style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
                  )),
                ),
                createInfoLine('Организатор', variant.company.name),
                createInfoLine('Уровень похода', difficultyToStiring(variant.difficulty)),
                createInfoLine('Дата тура', variant.date),
                createInfoLine('Стоимость', variant.coast.toString()),
                createInfoLine('Выезд', variant.outTime),
                createInfoLine('Приезд', variant.backTime),
                createInfoLine('С собой необходимо взять', variant.neededItems),
                createInfoLine('Фотограф в туре', variant.photographer ? 'есть' : 'нет'),
                ...variant.details.map((e) => createInfoLine(e.title, e.description)).toList(),
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
                              var contacts = variant.company.contacts;
                              List<Widget> widgetList = [
                                Container(
                                  width: 1.sw,
                                  child: TextButton(
                                      onPressed: () {
                                        launch("tel://${contacts.phone}");
                                      },
                                      child: Text('Связаться по телефону')),
                                )
                              ];
                              if (contacts.telegram != null) {
                                widgetList.add(
                                  Container(
                                    width: 1.sw,
                                    child: TextButton(
                                      onPressed: () {
                                        launch("https://www.telegram.me/${contacts.telegram}");
                                      },
                                      child: Text('Telegram'),
                                    ),
                                  ),
                                );
                              }
                              if (contacts.whatsapp != null) {
                                widgetList.add(
                                  Container(
                                    width: 1.sw,
                                    child: TextButton(
                                      onPressed: () {
                                        launch("https://wa.me/${contacts.whatsapp}");
                                      },
                                      child: Text('WhatsApp'),
                                    ),
                                  ),
                                );
                              }
                              if (contacts.telegram != null) {
                                widgetList.add(
                                  Container(
                                    width: 1.sw,
                                    child: TextButton(
                                      onPressed: () {
                                        launch("https://www.instagram.com/${contacts.instagram}");
                                      },
                                      child: Text('Instagram'),
                                    ),
                                  ),
                                );
                              }

                              return Column(children: widgetList, mainAxisSize: MainAxisSize.min);
                            },
                          );
                        },
                        child: Text('Забронировать'),
                      ),
                    ),
                  ),
                ),
                feeds.isNotEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          createInfoLine('Отзывы', ''),
                          CarouselSlider.builder(
                            options: CarouselOptions(viewportFraction: 1, disableCenter: true),
                            itemCount: feeds.length,
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
                                                  items: [feeds[index].photo],
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
                                              url: feeds[index].photo,
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
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Text(
                                              feeds[index].feed,
                                              style: TextStyle(fontSize: 18.sp),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Align(
                                                alignment: Alignment.bottomRight,
                                                child: Text(
                                                  feeds[index].name,
                                                  style: TextStyle(
                                                      fontSize: 20.sp, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ) // Text(feeds[0].name)
                                ],
                              );
                            },
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget createInfoLine(String title, String description) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: RichText(
        text: TextSpan(
          // Note: Styles for TextSpans must be explicitly defined.
          // Child text spans will inherit styles from parent
          style: new TextStyle(
            fontSize: 20.sp,
            color: Colors.black,
          ),
          children: <TextSpan>[
            new TextSpan(text: '$title: ', style: new TextStyle(fontWeight: FontWeight.bold)),
            new TextSpan(text: description),
          ],
        ),
      ),
    );
  }
}
