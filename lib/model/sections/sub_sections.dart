
class SubSections{

  List<SubSectionData>? data;

  SubSections({this.data});

  factory SubSections.fromJson(List<dynamic> parsedJson) {

    List<SubSectionData> sections = [];
    sections = parsedJson.map((i) => SubSectionData.fromJson(i)).toList();

    return SubSections(data: sections);
  }
}

class SubSectionData {
  int? id;
  String? subGroupName;
  String? subGroupImage;

  SubSectionData({this.id, this.subGroupName, this.subGroupImage});

  SubSectionData.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    subGroupName = json['SubGroupName'];
    subGroupImage = json['SubGroupImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = id;
    data['SubGroupName'] = subGroupName;
    data['SubGroupImage'] = subGroupImage;
    return data;
  }
}