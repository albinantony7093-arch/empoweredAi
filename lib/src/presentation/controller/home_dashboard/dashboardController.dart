import 'package:get/get.dart';

class DashboardController extends GetxController {
  var recentScores = [2, 0].obs;
  var selectedExam = 0.obs;

  var weakAreas = [
    "MECHANICS",
    "ECOLOGY",
    "ELECTROSTATICS",
    "PLANT_PHYSIOLOGY"
  ].obs;

  var topicAccuracy = {
    "MECHANICS": {"percent": 0, "count": 1},
    "ECOLOGY": {"percent": 0, "count": 1},
    "ELECTROSTATICS": {"percent": 0, "count": 1},
    "PLANT_PHYSIOLOGY": {"percent": 0, "count": 1},
    "REPRODUCTION": {"percent": 100, "count": 2},
  }.obs;
}