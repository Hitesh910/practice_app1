class HomeModel {
  int? id;
  String? title, description, image;
  num? price;

  HomeModel({this.id, this.title, this.description, this.price, this.image});

  factory HomeModel.mapToModel(Map m1) {
    return HomeModel(
        id: m1['id'],
        title: m1['title'],
        description: m1['description'],
        price: m1['price'],
        image: m1['image']);
  }
}
