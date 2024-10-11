import 'dart:convert';

import 'package:http/http.dart' as http;

import '../screen/home/model/home_model.dart';
class ApiHelper
{
  static ApiHelper helper = ApiHelper._();
  ApiHelper._();
  Future<List<HomeModel>?> getData()
  async {
    String link = "https://fakestoreapi.com/products";

    var responces =await http.get(Uri.parse(link));

    if(responces.statusCode == 200)
      {
        List json = jsonDecode(responces.body);
        List<HomeModel>? modelList = json.map((e) => HomeModel.mapToModel(e),).toList();
        print(" ========================= model list ${modelList.length}");
        print(" ========================= model list ${modelList[0].title}");
        return modelList;
      }
    return null;
  }
}