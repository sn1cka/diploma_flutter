import 'package:flutter_app/api/tour_model.dart';

import 'company_model.dart';

class FakeData{
  static final fakeTour = Tour(
    photoUrl: 'https://i.pinimg.com/736x/1b/a3/58/1ba358b1423b98460024e8f1b8929088.jpg',
    name: 'Слезы барса',
    region: 'Иссыкульская область',
    variants: [
      TourVariant(
          company: Company(
              name: 'Kettik.kg',
              companyFeed: [
                CompanyFeed(
                    name: 'Антон',
                    photo: 'https://auca.kg/uploads/_sitepictures/gallery/pict17.jpg',
                    feed: 'Выбрались вместе с Kettik, было прикольно')
              ],
              contacts: CompanyContacts(telephone: '+996777261969')),
          coast: 300,
          date: '21.01',
          details: TourDetails(
              difficulty: 'сложно',
              outTime: '21:31',
              backTime: '20:00',
              neededItems: 'с собой взять все'))
    ],
    additionalPhotosUrl: [
      'https://sputnik.kg/images/104791/55/1047915505.jpg',
      'https://kbcity.kg/wp-content/uploads/2020/01/1034108748-620x330.jpg',
      'https://st-1.akipress.org/127/.storage/business/images/Sveta/turism/143a3bd1691e05dffede0f991cef4bd8.jpg',
      'https://samarkandtours.com/wp-content/uploads/2021/02/Nature-of-Kyrgyzstan-4.jpg',
      'https://sputnik.kg/images/103410/88/1034108838.jpg'
    ],
  );
}