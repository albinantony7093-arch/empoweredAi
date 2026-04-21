import 'dart:developer';

import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;

  final selected = "ug".obs;

  final Map<String, Map<String, String>> data = {
    "ug": {
      "desc":
          "Undergraduate entrance — 50 questions from Physics, Chemistry, and Biology.",
      "btn": "Start UG Test",
      "q": "50",
      "s": "PCB",
      "l": "UG",
    },
    "pg": {
      "desc": "Postgraduate entrance — advanced medical level test.",
      "btn": "Start PG Test",
      "q": "60",
      "s": "Clinical",
      "l": "PG",
    },
  };

  void selectExam(String type) {
    selected.value = type;
  }

  Map<String, String> get current => data[selected.value]!;

  void changeIndex(int index) {
    log("current index:$index");
    currentIndex.value = index;
  }
}
