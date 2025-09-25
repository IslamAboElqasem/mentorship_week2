import 'package:flutter/material.dart';

class HorizontalTabsView extends StatefulWidget {
  const HorizontalTabsView({super.key});

  @override
  State<HorizontalTabsView> createState() => _HorizontalTabsViewState();
}

class _HorizontalTabsViewState extends State<HorizontalTabsView> {
  int selectedIndex = 0; // 👈 المؤشر اللي متعلم عليه

  final List<String> categories = [
    "All",
    "Popular",
    "Trending",
    "New Releases",
    "Top Rated",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45, // عشان الـ ListView ياخد مساحة واضحة
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final bool isSelected = selectedIndex == index;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index; // 👈 تحديث المؤشر
                });
              },
              child: Container(
                height: 35,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.blue),
                ),
                child: Center(
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.blue,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Raleway',
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
