import 'package:flutter/material.dart';

class SeriesView extends StatelessWidget {
  SeriesView({super.key});

  final Map<String, List<String>> series = {
    "fe014568011a55ab540b3286de792753b0456d7b.png": [
      "Detective Conan",
      "Mystery",
      "5.0"
    ],
    "002731df54975cb8af47dafb6419f5d3b81de5bc.png": [
      "Hunter x Hunter",
      "Adventure",
      "5.0"
    ],
    "9c189019758d6adc8155a15e0e3aa6cd79183c9b.jpg": [
      "Dragon Ball",
      "Adventure",
      "5.0"
    ],
  };

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: series.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 14, top: 20),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        width: 184,
                        height: 245,
                        "assets/images/${series.keys.elementAt(index)}",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Color(0xff5436F8),
                                size: 16,
                              ),
                              Text(
                                series.values.elementAt(index)[2],
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff1E1E1E),
                                ),
                              )
                            ],
                          )),
                    )
                  ],
                ),
                Text(
                  series.values.elementAt(index)[0],
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    color: Color(0xff18153F),
                  ),
                ),
                Text(
                  series.values.elementAt(index)[1],
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    color: Color(0xffA9A9A9),
                  ),
                )
              ],
            ),
          );
        });
  }
}
