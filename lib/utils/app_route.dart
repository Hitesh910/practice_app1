import 'package:flutter/material.dart';
import 'package:practice_app1/screen/database/view/database_screen.dart';
import 'package:practice_app1/screen/firebase/view/firebase_screen.dart';
import 'package:practice_app1/screen/home/view/home_screen.dart';

Map<String,WidgetBuilder> app_routes = {
  "/":(context) => HomeScreen(),
  "/database":(context) => DatabaseScreen(),
  "/firebase":(context) => FirebaseScreen(),
};