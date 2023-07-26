import 'package:flutter/material.dart';

class GlobalVariables {
  static const baseUrl = 'http://103.175.220.91:1337';
  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Promo',
      'image': 'assets/images/sale-tag.png',
    },
    {
      'title': 'Jasa Service',
      'image': 'assets/images/customer-support.png',
    },
    {
      'title': 'Mobiles',
      'image': 'assets/images/mobiles.jpeg',
    },
    {
      'title': 'Essentials',
      'image': 'assets/images/essentials.jpeg',
    },
    {
      'title': 'Appliances',
      'image': 'assets/images/appliances.jpeg',
    },
    {
      'title': 'Books',
      'image': 'assets/images/books.jpeg',
    },
    {
      'title': 'Fashion',
      'image': 'assets/images/fashion.jpeg',
    },
  ];

  static const List<String> bannerImages = [
    'https://s4.bukalapak.com/cinderella/ad-inventory/64a4e47fca498440def44d7f/w-640/Home%20Banner%20Bukalapak_Desktop%20%5B1668x704%5D%20(34)-1688527996814.jpg.webp',
    'https://s4.bukalapak.com/cinderella/ad-inventory/64a3af7ecb0947067bf66e62/w-640/Home%20Banner%20Bukalapak_Desktop%20%5B1668x704%5D%20(30)-1688448893081.jpg.webp',
    'https://images.tokopedia.net/img/cache/1208/NsjrJu/2023/7/25/db0d466c-ffb7-4e35-b173-be4d4547fe75.jpg.webp?ect=4g',
  ];

  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = const Color(0xffEE4D2D);
  static const unselectedNavBarColor = Colors.black87;
}
