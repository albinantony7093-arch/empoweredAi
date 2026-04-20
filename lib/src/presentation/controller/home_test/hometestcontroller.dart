import 'package:get/get.dart';

class HomeTestController extends GetxController {
  final selectedExam = 0.obs;

  void changeExam(int index) {
    selectedExam.value = index;
  }
}