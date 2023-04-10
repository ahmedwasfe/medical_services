
class MainSections{

  List<MainSectionData>? data;

  MainSections({this.data});

  factory MainSections.fromJson(List<dynamic> parsedJson) {

    List<MainSectionData> sections = <MainSectionData>[];
    sections = parsedJson.map((i) => MainSectionData.fromJson(i)).toList();

    return MainSections(data: sections);
  }
}

class MainSectionData {
  int? groupID;
  String? groupName;
  String? groupImage;

  MainSectionData({this.groupID, this.groupName, this.groupImage});

  MainSectionData.fromJson(Map<String, dynamic> json) {
    groupID = json['GroupID'];
    groupName = json['GroupName'];
    groupImage = json['GroupImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['GroupID'] = groupID;
    data['GroupName'] = groupName;
    data['GroupImage'] = groupImage;
    return data;
  }
}