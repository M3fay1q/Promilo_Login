import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:promilo_development_task/src/view/meet_up_screen/meet_up_controller.dart';
import 'package:share_plus/share_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DescriptionScreen extends StatelessWidget {
  DescriptionScreen({super.key});
  final MeetUpController meetUpController = Get.put(MeetUpController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MeetUpController>(
        init: meetUpController,
        builder: (controller) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            appBar: AppBar(
              shadowColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              elevation: 1,
              leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 16,
                ),
              ),
              titleSpacing: 5,
              title: const Text(
                'Description',
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 16, 32, 51),
                    fontWeight: FontWeight.w600),
              ),
            ),
            body: ListView(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16, top: 16),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                      ),
                      color: Color.fromARGB(255, 221, 221, 221),
                    ),
                    height: Get.height * 0.45,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        CarouselSlider.builder(
                          itemCount: meetUpController.bannerMenuItems.length,
                          options: CarouselOptions(
                            height: Get.height * 0.4,
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
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                  image: AssetImage(meetUpController
                                      .bannerMenuItems[index].images),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 50.0),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: AnimatedSmoothIndicator(
                              activeIndex: meetUpController.activeIndex_,
                              count: meetUpController.bannerMenuItems.length,
                              effect: const SlideEffect(
                                dotWidth: 8,
                                dotHeight: 8,
                                activeDotColor:
                                    Color.fromARGB(255, 255, 255, 255),
                                dotColor: Color.fromARGB(255, 169, 169, 169),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            height: Get.height * 0.05,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(
                                  Icons.insert_comment_rounded,
                                  color: Color.fromARGB(255, 113, 113, 113),
                                ),
                                const Icon(Icons.bookmark_border,
                                    color: Color.fromARGB(255, 102, 102, 102)),
                                const Icon(Icons.favorite_border,
                                    color: Color.fromARGB(255, 117, 117, 117)),
                                const Icon(Icons.zoom_out_map_sharp),
                                const Icon(Icons.star_border),
                                InkWell(
                                    onTap: () {
                                      Share.share(
                                          'hi, you can share this to your friends');
                                    },
                                    child: const Icon(Icons.share)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 6,
                      ),
                      const Icon(
                        Icons.bookmark_border,
                        color: Colors.blue,
                        size: 20,
                      ),
                      const Text(
                        '  1034   ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 112, 112, 112),
                        ),
                      ),
                      const Icon(
                        Icons.favorite_border,
                        color: Colors.blue,
                        size: 20,
                      ),
                      const Text(
                        '  1034   ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 112, 112, 112),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 202, 202, 202),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: RatingBarIndicator(
                              rating: 3.2,
                              itemCount: 5,
                              itemSize: 14.0,
                              unratedColor: Colors.white,
                              itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.blue,
                                  )),
                        ),
                      ),
                      const Text(
                        '  3.2   ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 10, 126, 210),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, bottom: 4, top: 6),
                  child: Text(
                    'Actor Name',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 38, 38, 38),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, bottom: 4),
                  child: Text(
                    'Indian Actress',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 99, 98, 98),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, bottom: 4, top: 4),
                  child: Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Color.fromARGB(255, 133, 133, 133),
                        size: 15,
                      ),
                      Text(
                        '  Duration 20 Mins',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 99, 98, 98),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, bottom: 4, top: 4),
                  child: Row(
                    children: [
                      Icon(
                        Icons.account_balance_wallet_outlined,
                        color: Color.fromARGB(255, 133, 133, 133),
                        size: 15,
                      ),
                      Text(
                        '  Total Average Fees ₹9,999',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 99, 98, 98),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, bottom: 4, top: 6),
                  child: Text(
                    'About',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 38, 38, 38),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, bottom: 4, right: 16),
                  child: Text(
                    'Human cardiovascular system, organ system that conveys blood through vessels to and from all parts of the body, carrying nutrients and oxygen to tissues and removing carbon dioxide and other wastes. It is a closed tubular system in which the blood is propelled by a muscular heart. Two circuits, the pulmonary and the systemic, consist of arterial, capillary, and venous components.',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 99, 98, 98),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 16.0, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'See More',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 1, 135, 202),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
