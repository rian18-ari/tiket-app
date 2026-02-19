import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news_trial/app/modules/homePage/views/home_page_view.dart';
import 'package:news_trial/app/modules/ticketPage/views/ticket_page_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.indexPage.value,
          children: [HomePageView(), TicketPageView()],
        )
      ),

      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              label: 'Ticket',
            ),
          ],
          currentIndex: controller.indexPage.value,
          onTap: controller.changeIndex,
        )
      ),
    );
  }
}
