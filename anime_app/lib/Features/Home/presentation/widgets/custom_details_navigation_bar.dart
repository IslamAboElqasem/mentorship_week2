import 'package:anime_app/Features/upgrade_plan/presentation/upgrade_plan_screen.dart';
import 'package:flutter/material.dart';

class CustomDetailsNavigationBar extends StatefulWidget {
  const CustomDetailsNavigationBar({super.key});

  @override
  State<CustomDetailsNavigationBar> createState() =>
      _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomDetailsNavigationBar> {
  int currentPageIndex = 0;

  final List<Map<String, dynamic>> items = [
    {"icon": "assets/icons/preciew.png", "label": "preview"},
    {"icon": "assets/icons/eye.png", "label": "Watch Now"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      color: const Color(0xFF16103C),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final isSelected = currentPageIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                currentPageIndex = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF6758FE)
                    : const Color(0xFF464061),
                borderRadius: BorderRadius.circular(25),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UpgradePlanScreen(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Image.asset(
                      items[index]["icon"],
                      color: Colors.white,
                      height: 22,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      items[index]["label"],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
