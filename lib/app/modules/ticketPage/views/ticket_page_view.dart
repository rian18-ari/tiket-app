import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ticket_page_controller.dart';

class TicketPageView extends GetView<TicketPageController> {
  const TicketPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TicketPageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TicketPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
