import 'package:anime_app/Features/Home/presentation/widgets/custom_details_navigation_bar.dart';
import 'package:anime_app/Features/Home/presentation/widgets/custom_series_details.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomDetailsNavigationBar(),
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/8c19c49e59f1b8d76b3a01bc6b8e167c3135c47e.jpg",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFF4B284D),
                        Color(0xFF2C1E51),
                      ],
                    ),
                  ),
                  child: const CustomSeriesDetails(),
                )
              ],
            ),
          ),
          Positioned(
            top: 420,
            right: 75,
            child: Image.asset(
              width: 230,
              height: 230,
              'assets/images/Group 15.png',
            ),
          )
        ],
      )),
    );
  }
}
