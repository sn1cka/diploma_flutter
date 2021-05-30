import 'package:flutter_app/models/tour_model.dart';

import 'company_model.dart';

class FakeData {
  static final variantList = [variant, variant, variant, variant];
  static final tourList = [
    tour,
    tour,
    tour,
    tour,
    tour,
    tour,
    tour,
    tour,
  ];

  static final feedList = [feed, feed, feed];

  static final feed = TourFeed(
      name: 'Антон',
      photo:
          'https://pbs.twimg.com/profile_images/1017848526515195905/OYbkL9-0.jpg',
      feed:
          'Отлично провели время с друзьями. Благодаря Kettik.kg выбрались подальше от города и испытали свои ноги');

  static final variant = TourVariant(
    company: Company(
        name: 'Kettik.kg',
        contacts: CompanyContacts(
            phone: '+996777261969',
            whatsapp: '996999261969',
            instagram: 'kettik.kg',
            telegram: 'sn1cka',
            id: 0),
        id: 0),
    coast: 300,
    date: '21.01',
    details: TourDetails(
        id: 0,
        difficulty: 'Сложно ',
        out_time: '21:31',
        back_time: '20:00',
        needed_items:
            'С собой необходимо взять: палочки, надеть крепкую обувь, воду с рассчетом на один день'),
  );
  static final tour = Tour(
    variants: variantList,
    id: 1,
    photo:
        'https://i.pinimg.com/736x/1b/a3/58/1ba358b1423b98460024e8f1b8929088.jpg',
    name: 'Слезы барса',
    region: 'Иссыкульская область',
    photos: [
      'https://sputnik.kg/images/104791/55/1047915505.jpg',
      'https://kbcity.kg/wp-content/uploads/2020/01/1034108748-620x330.jpg',
      'https://st-1.akipress.org/127/.storage/business/images/Sveta/turism/143a3bd1691e05dffede0f991cef4bd8.jpg',
      'https://samarkandtours.com/wp-content/uploads/2021/02/Nature-of-Kyrgyzstan-4.jpg',
      'https://sputnik.kg/images/103410/88/1034108838.jpg'
    ],
  );
}
