import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_app1/utils/app_route.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: app_routes,
    ),
  );
}
