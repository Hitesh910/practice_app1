class DatabaseModel
{
  int? cid;
  num? price;
  String? title,desc;

  DatabaseModel({this.price, this.title, this.desc,this.cid});

  factory DatabaseModel.mapToModel(Map m1)
  {
    return DatabaseModel(title: m1['title'],price: m1['price'],desc: m1['desc'],cid: m1['cid']);
  }
}