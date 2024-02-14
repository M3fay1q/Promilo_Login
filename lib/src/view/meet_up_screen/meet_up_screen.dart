import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promilo_development_task/src/view/meet_up_screen/meet_up_controller.dart';
import 'package:promilo_development_task/src/view/meet_up_screen/widget/meet_up_banner_widget_screen.dart';
import 'package:promilo_development_task/src/view/meet_up_screen/widget/meet_up_trending_widget.dart';

class MeetUpScreeen extends StatelessWidget {
  MeetUpScreeen({super.key});
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
              leading: const Icon(
                Icons.arrow_back_ios_new,
                size: 16,
              ),
              titleSpacing: 5,
              title: const Text(
                'Individual Meetup',
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 16, 32, 51),
                    fontWeight: FontWeight.w600),
              ),
            ),
            body: ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      // onChanged: onQueryChanged,
                      decoration: InputDecoration(
                          hintText: 'Search',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          // labelText: 'Search',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: Icon(Icons.mic_none_outlined)),
                    ),
                  ),
                ),
                MeetUpBannerWidgetScreen(),
                MeetUpTrendingWidgetScreen(),
              ],
            ),
          );
        });
  }
}
