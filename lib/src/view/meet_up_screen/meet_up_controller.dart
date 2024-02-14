import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeetUpController extends GetxController {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var roundedMenuItems = [];
  var bannerMenuItems = [];
  int activeIndex_ = 0;
  var horizontalBannerMenuItem = [];
  int currentIndex = 0;
  var number = ['01', '02', '03', '04', '05'];
  var randomImages = [
    // 'https://images.unsplash.com/photo-1597223557154-721c1cecc4b0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW4lMjBmYWNlfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
    'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg',
    'https://images.unsplash.com/photo-1542909168-82c3e7fdca5c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8ZmFjZXxlbnwwfHwwfHw%3D&w=1000&q=80',
    'https://i0.wp.com/post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/03/GettyImages-1092658864_hero-1024x575.jpg?w=1155&h=1528'
        'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg',
    'https://images.unsplash.com/photo-1542909168-82c3e7fdca5c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8ZmFjZXxlbnwwfHwwfHw%3D&w=1000&q=80',
    'https://i0.wp.com/post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/03/GettyImages-1092658864_hero-1024x575.jpg?w=1155&h=1528'
  ];

  @override
  void onInit() {
    bannerItemModel();
    horizontalBannerItemModel();
    super.onInit();
  }

  //Preparing rounde item menu model

  // preparing banner item model

  bannerItemModel() {
    bannerMenuItems = [
      HomeBannerItemModel(
        word: 'Popular Meetups in India',
        images: 'assets/banner1.jpg',
      ),
      HomeBannerItemModel(
          word: "Popular Meetups in India", images: 'assets/banner2.jpg'),
      HomeBannerItemModel(
          word: "Popular Meetups in India", images: 'assets/banner3.jpg'),
    ];
  }

  horizontalBannerItemModel() {
    horizontalBannerMenuItem = [
      //   HomeHorizontalBannerItemModel(
      //       image:
      //           'assets/images/home_image/horizontal_banner_images/h_banner1.png'),
      //   HomeHorizontalBannerItemModel(
      //       image:
      //           'assets/images/home_image/horizontal_banner_images/h_banner2.png'),
      //   HomeHorizontalBannerItemModel(
      //       image:
      //           'assets/images/home_image/horizontal_banner_images/h_banner3.png'),
      //   HomeHorizontalBannerItemModel(
      //       image:
      //           'assets/images/home_image/horizontal_banner_images/h_banner4.png'),
      //   HomeHorizontalBannerItemModel(
      //       image:
      //           'assets/images/home_image/horizontal_banner_images/h_banner5.png'),
      //   HomeHorizontalBannerItemModel(
      //       image:
      //           'assets/images/home_image/horizontal_banner_images/h_banner6.png'),
      //   HomeHorizontalBannerItemModel(
      //       image:
      //           'assets/images/home_image/horizontal_banner_images/h_banner7.png'),
      //   HomeHorizontalBannerItemModel(
      //       image:
      //           'assets/images/home_image/horizontal_banner_images/h_banner8.png'),
    ];
  }

  // drawer on tap functions
  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  // animatedsmoothindicator(carousel slider)
  void onPageChange(index) {
    activeIndex_ = index;
    update();
  }

  //Bottom Navigation bar onTap
  void onItemTapped(int index) {
    currentIndex = index;
    update();
  }
}

class HomeBannerItemModel {
  final String images;
  final String word;

  HomeBannerItemModel({required this.images, required this.word});
}
