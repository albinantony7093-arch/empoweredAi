import 'package:empowered_ai/src/presentation/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final mainctr = Get.find<HomeController>();

    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.97),
        border: Border(bottom: BorderSide(color: Color(0x14000000))),
        boxShadow: [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 12,
            offset: Offset(0, 2),
          ),
        ],
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A2B4A),
                  ),
                  children: [
                    TextSpan(text: "Empower"),
                    TextSpan(
                      text: "ED",
                      style: TextStyle(color: Color(0xFFD72638)),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 24),

              Obx(
                () => Row(
                  children: [
                    _navItem("Dashboard", 0, mainctr),
                    _navItem("Exams", 1, mainctr),
                    _navItem("Calm", 4, mainctr), // reuse ASK AI slot if needed
                    _navItem("Logout", -1, mainctr, isLogout: true),
                  ],
                ),
              ),
            ],
          ),

          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Color(0xFFFCEBEB),
                child: Text(
                  "AR",
                  style: TextStyle(
                    color: Color(0xFFA81E2C),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                "Arjun",
                style: TextStyle(color: Color(0xFF6B7280), fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _navItem(
    String title,
    int index,
    HomeController ctr, {
    bool isLogout = false,
  }) {
    final isActive = ctr.currentIndex.value == index;

    return GestureDetector(
      onTap: () {
        if (isLogout) {
          // handle logout
          print("Logout clicked");
        } else {
          ctr.changeIndex(index);
        }
      },
      child: Container(
        margin: const EdgeInsets.only(left: 18),
        padding: const EdgeInsets.only(bottom: 6),
        decoration: isActive
            ? const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xFFD72638), width: 2),
                ),
              )
            : null,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: isLogout
                ? const Color(0xFFD72638)
                : isActive
                ? const Color(0xFF1A2B4A)
                : const Color(0xFF6B7280),
          ),
        ),
      ),
    );
  }
}
