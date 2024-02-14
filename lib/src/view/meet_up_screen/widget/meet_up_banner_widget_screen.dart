import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promilo_development_task/src/view/meet_up_screen/meet_up_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MeetUpBannerWidgetScreen extends StatelessWidget {
  MeetUpBannerWidgetScreen({super.key});
  final MeetUpController meetUpController = Get.put(MeetUpController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: meetUpController.bannerMenuItems.length,
          options: CarouselOptions(
            height: Get.height * 0.22,
            autoPlay: true,
            onPageChanged: (index, reason) {
              meetUpController.onPageChange(index);
            },
            // autoPlayAnimationDuration:
            //     const Duration(milliseconds: 80),
            autoPlayInterval: const Duration(seconds: 4),
            // enableInfiniteScroll: true,
            viewportFraction: 1,
            initialPage: 0,
            pauseAutoPlayOnTouch: true,
          ),
          itemBuilder: ((context, index, realIndex) {
            return Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18, top: 18),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: AssetImage(
                        meetUpController.bannerMenuItems[index].images),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(
          height: 8,
        ),
        AnimatedSmoothIndicator(
          activeIndex: meetUpController.activeIndex_,
          count: meetUpController.bannerMenuItems.length,
          effect: const SlideEffect(
            dotWidth: 6,
            dotHeight: 6,
            activeDotColor: Color.fromARGB(255, 0, 0, 0),
            dotColor: Color.fromARGB(255, 169, 169, 169),
          ),
        ),
      ],
    );
  }
}
