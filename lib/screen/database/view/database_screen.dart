import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_app1/screen/home/controller/home_controller.dart';
class DatabaseScreen extends StatefulWidget {
  const DatabaseScreen({super.key});

  @override
  State<DatabaseScreen> createState() => _DatabaseScreenState();
}

class _DatabaseScreenState extends State<DatabaseScreen> {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Database"),),
      body: ListView.builder(itemCount: controller.dbData.length,itemBuilder: (context, index) {
       return Text("${controller.dbData[index].title}");
      },),
    );
  }
}
