import 'package:anime_app/Features/Home/presentation/widgets/characters_view.dart';
import 'package:anime_app/Features/Home/presentation/widgets/custom_navigation_bar.dart';
import 'package:anime_app/Features/Home/presentation/widgets/horizontal_tabs_view.dart';
import 'package:anime_app/Features/Home/presentation/widgets/series_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const Padding(
          padding: EdgeInsets.only(bottom: 25),
          child: CustomNavigationBar(),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFDDE2FF),
                      Color(0xFFFFFFFF),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              top: -80, // جزء الصورة يطلع بره
              right: -180, // تخليها طالعة بره من اليمين
              child: Image.asset(
                "assets/images/photo_5954034680963648000_x-removebg-preview.png",
                width: 432,
                height: 432,
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 14, top: 23),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Where Anime Comes Alive',
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w700,
                            color: Color(0xff18153F)),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const SizedBox(height: 28, child: HorizontalTabsView()),
                      SizedBox(
                        height: 310,
                        child: SeriesView(),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Top Characters',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w700,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 190,
                        child: CharactersView(),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
