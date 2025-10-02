import 'package:flutter/material.dart';

class CustomSeriesDetails extends StatelessWidget {
  const CustomSeriesDetails({super.key});

  final List<String> details = const [
    "Dark Fantasy",
    "Action",
    "Adventure",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 80,
        ),
        Row(
          children: List.generate(details.length, (index) {
            return Padding(
              padding: const EdgeInsets.all(6),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFF464061),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: const Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: Text(
                  details[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
