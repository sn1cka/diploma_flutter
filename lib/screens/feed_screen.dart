// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_app/api/company_model.dart';
// import 'package:flutter_app/api/tour_model.dart';
// import 'package:flutter_app/components/app_bar.dart';
// import 'package:flutter_app/components/stacked_image_with_text.dart';
// import 'package:flutter_app/screens/detailed_screen.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import 'images_screen.dart';
//
// class CompaniesScreen extends StatelessWidget {
//   final List<Company> companyList;
//   final title;
//
//   const CompaniesScreen(
//       {Key? key,
//         required this.companyList,
//         this.title = 'Список Компаний-Организаторов туров'})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           TransparentAppBar(),
//           Padding(
//             padding: EdgeInsets.fromLTRB(16.w, 0, 0, 0),
//             child: Text(
//               title,
//               textAlign: TextAlign.start,
//               style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               scrollDirection: Axis.vertical,
//               itemCount: companyList.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: EdgeInsets.all(16.w),
//                   child: InkWell(
//                     child: Column(
//                       children: [Text(this.companyList[index].name)],
//                     ),
//                     onTap: () {
//
//                      showModalBottomSheet(context: context, builder: (context) => CompanyFeedDialog(),)
//                     },
//                   ),
//                 );
//               },
//             ),
//           )
//         ]),
//       ),
//     );
//   }
// }
//
// class CompanyFeedDialog extends StatefulWidget {
//   const CompanyFeedDialog({Key? key}) : super(key: key);
//
//   @override
//   _CompanyFeedDialogState createState() => _CompanyFeedDialogState();
// }
//
// class _CompanyFeedDialogState extends State<CompanyFeedDialog> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [ Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.all(16.w),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(8.w),
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (context) {
//                               return CarouselImageShower(
//                                 items: [feeds[index].photo],
//                                 tag: 'Tag$index',
//                               );
//                             },
//                           ),
//                         );
//                       },
//                       child: Container(
//                         width: (1 / 3).sw,
//                         height: (3 / 5).sh,
//                         child: Hero(
//                           tag: 'MainImage',
//                           child: ProgressiveNetworkImage(
//                             url: feeds[index].photo,
//                             boxfit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: SingleChildScrollView(
//                       child: Column(
//                         children: [
//                           Text(
//                             feeds[index].feed,
//                             style: TextStyle(fontSize: 18.sp),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Align(
//                               alignment: Alignment.bottomRight,
//                               child: Text(
//                                 feeds[index].name,
//                                 style: TextStyle(
//                                     fontSize: 20.sp, fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ) // Text(feeds[0].name)
//               ],
//             ),
//           },
//
//       ],
//     );
//   }
// }
//
