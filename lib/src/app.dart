import 'package:empowered_ai/src/presentation/screens/home_dashboard/home_ugpg.dart';
import 'package:empowered_ai/src/presentation/screens/landing/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class EmpowerdAi extends StatelessWidget {
  const EmpowerdAi({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'EmpoweredAi',
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      // home: LandingPage(),
      home: DashboardPage(),
    );
  }
}
