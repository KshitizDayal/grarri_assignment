List<DishModel> dishFromJson(List<Map<String, Object>> str) =>
    List<DishModel>.from(str.map((x) => DishModel.fromJson(x)));

class DishModel {
  String? dishId;
  String? dishName;
  int? price;
  String? dishPicture;
  bool? veg;
  String? category;
  int? count;

  DishModel(
      {this.dishId,
      this.dishName,
      this.price,
      this.dishPicture,
      this.veg,
      this.category,
      this.count});

  DishModel.fromJson(Map<String, dynamic> json) {
    dishId = json['dish_id'];
    dishName = json['dish_name'];
    price = json['price'];
    dishPicture = json['dish_picture'];
    veg = json['veg'];
    category = json['category'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dish_id'] = dishId;
    data['dish_name'] = dishName;
    data['price'] = price;
    data['dish_picture'] = dishPicture;
    data['veg'] = veg;
    data['category'] = category;
    data['count'] = count;
    return data;
  }
}
