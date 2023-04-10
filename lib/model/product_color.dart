

class ProductColor {
  bool? status;
  String? msg;
  Result? result;

  ProductColor({this.status, this.msg, this.result});

  ProductColor.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  List<ColorData>? colors;

  Result({this.colors});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['colors'] != null) {
      colors = <ColorData>[];
      json['colors'].forEach((v) {
        colors!.add(new ColorData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.colors != null) {
      data['colors'] = this.colors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ColorData {
  int? id;
  String? name;
  String? hexaCode;
  String? humanName;
  bool isSelected = false;

  ColorData({this.id, this.name, this.hexaCode, this.humanName, this.isSelected = false});

  ColorData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    hexaCode = json['hexa_code'];
    humanName = json['human_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['hexa_code'] = this.hexaCode;
    data['human_name'] = this.humanName;
    return data;
  }
}