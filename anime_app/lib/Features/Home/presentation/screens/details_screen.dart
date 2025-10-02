import 'package:anime_app/Features/Home/presentation/widgets/Custom_about_series.dart';
import 'package:anime_app/Features/Home/presentation/widgets/custom_details_navigation_bar.dart';
import 'package:anime_app/Features/Home/presentation/widgets/custom_rating.dart';
import 'package:anime_app/Features/Home/presentation/widgets/custom_series_details.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomDetailsNavigationBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // صورة الكوفر
              Image.asset(
                "assets/images/8c19c49e59f1b8d76b3a01bc6b8e167c3135c47e.jpg",
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              Stack(
                clipBehavior: Clip.none,
                children: [
                  // الـ Container اللي تحت
                  Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(top: 15),
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
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomSeriesDetails(),
                          SizedBox(
                            height: 23,
                          ),
                          Divider(
                            color: Color(0xFF4F4661),
                            thickness: 1,
                            indent: 25,
                            endIndent: 25,
                          ),
                          CustomRating(),
                          Divider(
                            color: Color(0xFF4F4661),
                            thickness: 1,
                            indent: 25,
                            endIndent: 25,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomAboutSeries(),
                          SizedBox(
                            height: 30,
                          )
                        ],
                      )),

                  // اللوجو فوق الـ Container
                  Positioned(
                    top:
                        -130, // يخلي نص الصورة فوق الكوفر ونصها في الـ Container
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Image.asset(
                        'assets/images/Group 15.png',
                        width: 230,
                        height: 230,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
