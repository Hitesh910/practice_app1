import 'package:get/get.dart';
import 'package:practice_app1/screen/home/model/home_model.dart';

import '../../../utils/api_helper.dart';

class HomeController extends GetxController
{
  RxList<HomeModel> dataList = <HomeModel>[].obs;
  Future<void> getData()
  async {
   dataList.value =await ApiHelper.helper.getData() ?? [];
   print("================ ${dataList[1].title}");
  }
}