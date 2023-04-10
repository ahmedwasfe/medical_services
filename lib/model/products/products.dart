
class Products{

  List<ProductData>? data;

  Products({this.data});

  factory Products.fromJson(List<dynamic> parsedJson) {

    List<ProductData> products = [];
    products = parsedJson.map((i) => ProductData.fromJson(i)).toList();

    return Products(data: products);
  }
}

class ProductData {
  int? itemNo;
  String? itemName;
  int? groupID;
  int? price;
  String? notes;
  String? itemImage;

  ProductData(
      {this.itemNo,
        this.itemName,
        this.groupID,
        this.price,
        this.notes,
        this.itemImage});

  ProductData.fromJson(Map<String, dynamic> json) {
    itemNo = json['ItemNo'];
    itemName = json['ItemName'];
    groupID = json['GroupID'];
    price = json['Price'];
    notes = json['notes'];
    itemImage = json['ItemImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ItemNo'] = itemNo;
    data['ItemName'] = itemName;
    data['GroupID'] = groupID;
    data['Price'] = price;
    data['notes'] = notes;
    data['ItemImage'] = itemImage;
    return data;
  }
}