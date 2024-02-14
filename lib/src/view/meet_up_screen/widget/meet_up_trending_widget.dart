import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promilo_development_task/src/helpers/app_routes.dart';
import 'package:promilo_development_task/src/utils/colors.dart';
import 'package:promilo_development_task/src/view/meet_up_screen/meet_up_controller.dart';

class MeetUpTrendingWidgetScreen extends StatelessWidget {
  MeetUpTrendingWidgetScreen({super.key});
  final MeetUpController meetUpController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      // mainAxisAlignment: MainAxisAlignment.s,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 18.0, top: 25),
          child: Text(
            'Trending Popular People',
            style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 16, 32, 51),
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 160,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: SizedBox(
                    height: 160,
                    width: Get.width * 0.8,
                    child: Card(
                      elevation: 0.4,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 107, 107, 107),
                              width: 0.5)
                          //set border radius more than 50% of height and width to make circle
                          ),
                      child: Column(children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0, top: 10),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 19,
                                backgroundColor:
                                    Color.fromARGB(255, 88, 87, 87),
                                child: CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 255, 255),
                                    radius: 18,
                                    child:
                                        Icon(Icons.auto_fix_normal_outlined)),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Author',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 16, 32, 51),
                                        fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    '1,028 Meetups',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color:
                                            Color.fromARGB(255, 108, 108, 108),
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Divider(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 14.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              for (int i = 0;
                                  i < meetUpController.randomImages.length;
                                  i++)
                                Align(
                                  widthFactor: 0.8,
                                  child: CircleAvatar(
                                    radius: 22,
                                    backgroundImage: NetworkImage(
                                        meetUpController.randomImages[i]),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 4.0, right: 10),
                              child: SizedBox(
                                height: 35,
                                width: 90,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      side: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 107, 107, 107),
                                          width: 0.5)
                                      //set border radius more than 50% of height and width to make circle
                                      ),
                                  color: AppColors.primaryColor,
                                  child: const Center(
                                    child: Text(
                                      'See more',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ]),
                    ),
                  ),
                );
              }),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 18.0, top: 10),
          child: Text(
            'Top Trending Meetups',
            style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 16, 32, 51),
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: SizedBox(
            height: 160,
            width: 150,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.description);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: Stack(
                        children: [
                          Card(
                            elevation: 0,
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                  image: AssetImage('assets/ll.jpg'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: SizedBox(
                              height: 60,
                              width: 60,
                              child: Card(
                                elevation: 0,
                                color: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      topLeft: Radius.circular(10)),
                                )
                                //set border radius more than 50% of height and width to make circle
                                ,
                                child: Center(
                                  child: Text(
                                    meetUpController.number[index],
                                    style: const TextStyle(
                                        fontSize: 40,
                                        color: Color.fromARGB(255, 16, 32, 51),
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        )
      ],
    );
  }
}
