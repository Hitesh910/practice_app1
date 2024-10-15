class FirebaseModel
{
  num? price;
  String? name,desc;

  FirebaseModel({this.name, this.price, this.desc});

  factory FirebaseModel.mapToModel(Map m1)
  {
    return FirebaseModel(name: m1['name'],price: m1['price'],desc: m1['desc']);
  }
}