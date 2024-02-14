import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promilo_development_task/src/view/home/home_controller.dart';
import 'package:promilo_development_task/src/view/meet_up_screen/meet_up_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: homeController,
        builder: (controller) {
          return Scaffold(
            body: IndexedStack(
              index: homeController.currentIndex > 0 ? 1 : 0,
              children: [
                MeetUpScreeen(),
                tabBody(homeController.currentIndex),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) => homeController.onItemTapped(index),
              currentIndex: homeController.currentIndex,
              backgroundColor: Colors.white,
              unselectedItemColor: Colors.black,
              selectedItemColor: const Color.fromARGB(255, 2, 145, 211),
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.grid_view_outlined),
                  label: 'Prolet',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.handshake_outlined),
                  label: 'Meetup',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.manage_search_sharp),
                  label: 'Explore',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.person_outline),
                  label: 'Account',
                ),
              ],
            ),
          );
        });
  }

  Widget tabBody(int currentPage) {
    switch (currentPage) {
      case -1:
        return Container(color: Colors.white);
      case 0:
        return MeetUpScreeen();
      case 1:
        return MeetUpScreeen();
      case 2:
        return MeetUpScreeen();
      case 3:
        return MeetUpScreeen();
      case 4:
        return MeetUpScreeen();
    }

    return MeetUpScreeen();
  }
}
