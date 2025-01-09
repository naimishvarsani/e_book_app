import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List valuesData = [];
  RxBool isLoader = false.obs;

  @override
  void onInit() {
    isLoader.value = true;
    loadJsonData();
    isLoader.value = false;
    super.onInit();
  }

  Future<void> loadJsonData() async {
    final String response = await rootBundle.loadString('assets/shlokas.json');
    final data = json.decode(response);
    print(data);
    valuesData = data;
  }
}
