import 'package:get/get.dart';
import 'package:practice_app1/screen/home/model/databse_model.dart';
import 'package:practice_app1/screen/home/model/firebase_model.dart';
import 'package:practice_app1/screen/home/model/home_model.dart';
import 'package:practice_app1/utils/helper/database_helper.dart';
import 'package:practice_app1/utils/helper/firebase_dbHelper.dart';

import '../../../utils/api_helper.dart';

class HomeController extends GetxController
{
  RxList<HomeModel> dataList = <HomeModel>[].obs;
  RxList<DatabaseModel> dbData = <DatabaseModel>[].obs;
  RxList<FirebaseModel> firedbData = <FirebaseModel>[].obs;
  Future<void> getData()
  async {
   dataList.value =await ApiHelper.helper.getData() ?? [];
   print("================ ${dataList[1].title}");
  }

  Future<void> readData()
  async {
    dbData.value =await DatabaseHelper.helper.readDb() ?? [];
  }

  Future<void> firereadData()
  async {
    firedbData.value =await FirebaseDbhelper.helper.getData() ?? [];
  }

}