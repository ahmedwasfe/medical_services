class ApiHelper {


  static const String _baseUrl = 'http://whiteds.truetime.ps/api';
  static const String MAIN_SECTIONS = '$_baseUrl/ItemsGroupsWithImages';
  static const String SUB_SECTIONS = '$_baseUrl/itemsSubGroupWithImages?mainGroup';
  static const String LOGIN = '$_baseUrl/LogInMatjar';
  static const String PRODUCTS = '$_baseUrl/ItemsW?GroupID';

  static String get baseUrl => _baseUrl;


  static Map<String, String> langHeader({required String language}) {
    return {'lang': language};
  }

  static Map<String, String> tokenHeader({required String token}) {
    return {'Authorization': token};
  }

  static Map<String, String> allHeader({required String token, required String language}) {
    return {
      'Accept': 'application/json',
      'Authorization': token,
      'lang': language};
  }
}
