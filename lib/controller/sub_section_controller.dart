import 'package:get/get.dart';
import 'package:medical_services/api/api_requests.dart';
import 'package:medical_services/model/sections/sub_sections.dart';

class SubSectionController extends GetxController{

  List<SubSectionData> listSubSections = [];


  Future<void> getSubSections({required int sectionId}) async {

    await ApiRequests.getSubSections(sectionId: sectionId)
        .then((value) {
          if(value != null){
            listSubSections.clear();
            listSubSections.addAll(value.data!);
            print('SIZE: ${listSubSections.length}');
          }
    });
  }

}