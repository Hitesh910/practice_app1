import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:practice_app1/screen/home/model/firebase_model.dart';

class FirebaseDbhelper
{
 static FirebaseDbhelper helper = FirebaseDbhelper._();
 FirebaseDbhelper._();
 FirebaseFirestore firestore = FirebaseFirestore.instance;

 Future<void> setData(FirebaseModel model)
 async {
 await firestore.collection("product").add({"name": model.name,"desc" : model.desc,"price" : model.price});
 }

 Future<List<FirebaseModel>> getData()
 async {
  QuerySnapshot snapshot = await firestore.collection("product").get();
  List<QueryDocumentSnapshot<Object?>> dataList = snapshot.docs;
  List<FirebaseModel> dbList = dataList.map((e) => FirebaseModel.mapToModel(e.data as Map),).toList();
  print("${dbList.length}");
  return dbList;
 }
}