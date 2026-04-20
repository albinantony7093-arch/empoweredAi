import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home_dashboard/dashboardController.dart';
import 'accuracy_row.dart';

class AccuracyList extends StatelessWidget {
  final DashboardController controller;

  const AccuracyList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: controller.topicAccuracy.entries
          .map((entry) => AccuracyRow(
        topic: entry.key,
        percent: entry.value["percent"] as int,
        count: entry.value["count"] as int,
      ))
          .toList(),
    );
  }
}