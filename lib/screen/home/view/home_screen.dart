import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:practice_app1/screen/home/model/databse_model.dart';
import 'package:practice_app1/utils/helper/database_helper.dart';

import '../../../utils/api_helper.dart';
import '../controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiHelper.helper.getData();
    controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("E commerce App"),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                 PopupMenuItem(
                  child: const Text("Database"),
                  onTap: () {
                    Get.toNamed("/database");
                  },
                ),
              ];
            },
          )
        ],
      ),
      body: Obx(
        () => GridView.builder(
          itemCount: controller.dataList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return Obx(
              () => Container(
                // height: height * 1,
                // width: width * 0.5,
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      spreadRadius: -0.5,
                      blurRadius: 0.2,
                    ),
                  ],
                  color: Colors.amber.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                        height: height * 0.12,
                        width: width * 0.4,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(2),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "${controller.dataList[index].image}"),
                              fit: BoxFit.contain,
                            ),
                          ),
                          // child: Text("${controller.dataList[index].title}"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Text(
                        "${controller.dataList[index].title}",
                        style: const TextStyle(
                          // overflow: TextOverflow.ellipsis,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "₹${controller.dataList[index].price}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              DatabaseModel model = DatabaseModel(
                                  title: controller.dataList[index].title,
                                  price: controller.dataList[index].price,
                                  desc: controller.dataList[index].description);
                              DatabaseHelper.helper.insertDb(model);
                              print("============== home screen${model.title}");
                              controller.readData();
                            },
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
