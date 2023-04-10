class ProductSize {
  bool? status;
  String? msg;
  Result? result;

  ProductSize({this.status, this.msg, this.result});

  ProductSize.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    result =
    json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  List<SizeData>? sizes;

  Result({this.sizes});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['sizes'] != null) {
      sizes = <SizeData>[];
      json['sizes'].forEach((v) {
        sizes!.add(new SizeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sizes != null) {
      data['sizes'] = this.sizes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SizeData {
  int? id;
  String? name;
  String? humanName;
  bool isSelected = false;

  SizeData({this.id, this.name, this.humanName, this.isSelected = false});

  SizeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    humanName = json['human_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['human_name'] = this.humanName;
    return data;
  }
}