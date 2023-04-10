import 'package:flutter/material.dart';
import 'package:medical_services/utils/app_text.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: AppText.medium(text: 'SEARCH')),
    );
  }
}
