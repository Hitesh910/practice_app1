import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_app1/screen/home/controller/home_controller.dart';

class FirebaseScreen extends StatefulWidget {
  const FirebaseScreen({super.key});

  @override
  State<FirebaseScreen> createState() => _FirebaseScreenState();
}

class _FirebaseScreenState extends State<FirebaseScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: controller.firedbData.length,
        itemBuilder: (context, index) {
          return Text("${controller.firedbData[index].name}");
        },
      ),
    );
  }
}
