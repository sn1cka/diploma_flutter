import 'package:flutter_app/models/company_model.dart';

class Tour {
  String photoUrl =
      'https://cdn.tripzaza.com/photos/images/000/022/399/excursion_main/15762598727873433_4d50.jpg?1558750371/assets/lib/resized/331/1600x1200_0x0_d0b.jpg';
  String name = 'Водопад \'Слезы Барса\'';
  String region = 'Иссыкульская облaсть';
  List<TourVariant> variants = [
    TourVariant(),
    TourVariant(),
    TourVariant(),
    TourVariant(),
    TourVariant(),
    TourVariant()
  ];
  List<String> additionalPhotosUrl = [
    'https://triptokyrgyzstan.com/sites/default/files/media/image/c_denis_frantosuzov.jpg',
    'https://triptokyrgyzstan.com/sites/default/files/media/image/c_sergey_kalachev.jpg',
    'https://i.pinimg.com/originals/54/6f/9b/546f9b0d0614d5560e61c954ed0abd01.jpg',
    'https://www.open.kg/uploads/posts/2018-06/1530346570_screenshot_38.png',
    'https://triptokyrgyzstan.com/sites/default/files/media/image/c_dmitriy_chistoprudov_0.jpg'
  ];
}

class TourVariant {
  Company company = Company();
  int coast = 300;
  String date = '21.06.2020';
  TourDetails details = TourDetails();
}

class TourDetails {
  String difficulty = 'Средний';
  String outTime = '06:00';
  String backTime = '20:00';
  String neededItems =
      'С собой необходимо иметь: дождевик, маску, антисептик, еду и воду с расчетом на один день';
}
