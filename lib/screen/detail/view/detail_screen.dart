import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_app1/screen/home/controller/home_controller.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: height * 0.5,
            width: width * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("${controller.dataList[0].image}"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
