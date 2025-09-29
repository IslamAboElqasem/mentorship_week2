import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int currentPageIndex = 0;

  final List<Map<String, dynamic>> items = [
    {"icon": "assets/icons/home-2.png", "label": "Home"},
    {"icon": "assets/icons/Group.png", "label": "Library"},
    {"icon": "assets/icons/search-normal.png", "label": "Search"},
    {"icon": "assets/icons/earth.png", "label": "Explore"},
    {"icon": "assets/icons/setting.png", "label": "Settings"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      color: Colors.transparent,
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
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color:
                    isSelected ? const Color(0xFF5436F8) : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Image.asset(
                    items[index]["icon"],
                    color: isSelected ? Colors.white : Colors.grey,
                    height: 22,
                  ),
                  if (isSelected) ...[
                    const SizedBox(width: 6),
                    Text(
                      items[index]["label"],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Raleway',
                      ),
                    )
                  ]
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
