class Tour {
  String photoUrl =
      'https://triptokyrgyzstan.com/sites/default/files/media/image/c_denis_frantosuzov.jpg';
  String name = 'Водопад \'Слезы Барса\'';
  String region = 'Иссыкульская обл';
  List<TourVariant> variants = [TourVariant(),TourVariant(),TourVariant(),TourVariant(),TourVariant(),TourVariant()];
  List<String> additionalPhotosUrl = [
    'https://triptokyrgyzstan.com/sites/default/files/media/image/c_denis_frantosuzov.jpg',
    'https://triptokyrgyzstan.com/sites/default/files/media/image/c_denis_frantosuzov.jpg',
    'https://triptokyrgyzstan.com/sites/default/files/media/image/c_denis_frantosuzov.jpg',
    'https://triptokyrgyzstan.com/sites/default/files/media/image/c_denis_frantosuzov.jpg',
    'https://triptokyrgyzstan.com/sites/default/files/media/image/c_denis_frantosuzov.jpg',
    'https://triptokyrgyzstan.com/sites/default/files/media/image/c_denis_frantosuzov.jpg',
    'https://triptokyrgyzstan.com/sites/default/files/media/image/c_denis_frantosuzov.jpg',
    'https://triptokyrgyzstan.com/sites/default/files/media/image/c_denis_frantosuzov.jpg',
  ];
}

class TourVariant {
  String organization = 'Kettik.kg';
  int coast = 300;
  String date = '21.06.2020';
  DetailedTour details = DetailedTour();

}

class DetailedTour {
  String difficulty = 'Средний';
  String outTime = '06:00';
  String backTime = '20:00';
  String neededItems =
      'С собой необходимо иметь: дождевик, маску, антисептик, еду и воду с расчетом на один день';
}

class Contacts {
  String? whatsApp = '996777261969';
  String? telegram = '996777261969';
  String? instagram = 'sn1cka';
  String telephone = '996777261969';
}
