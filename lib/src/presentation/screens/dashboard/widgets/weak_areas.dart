import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home_dashboard/dashboardController.dart';
import 'weak_tag.dart';

class WeakAreas extends StatelessWidget {
  final DashboardController controller;

  const WeakAreas({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: controller.weakAreas.map((e) => WeakTag(text: e)).toList(),
    );
  }
}