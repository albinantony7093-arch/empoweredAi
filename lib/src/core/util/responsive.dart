// import 'package:flutter/material.dart';

// class Responsive {
//   static bool isMobile(BuildContext context) =>
//       MediaQuery.of(context).size.width < 600;

//   static bool isTablet(BuildContext context) =>
//       MediaQuery.of(context).size.width < 1024;

//   static bool isDesktop(BuildContext context) =>
//       MediaQuery.of(context).size.width >= 1024;
// }

import 'package:flutter/material.dart';

class Responsive {
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static bool isMobile(BuildContext context) => width(context) < 600;
}
