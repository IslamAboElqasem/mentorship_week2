import 'package:flutter/material.dart';

class CharactersView extends StatelessWidget {
  const CharactersView({super.key});

  final Map<String, List<String>> characters = const {
    "4d7998d70dfe357ab23e17e2413b2fbdeac984e1.png": ['Gon Freecss', 'Hunter'],
    "36bb195fb1d6512ed50108785e6003ed2d3ad8dc.png": [
      'Naruto Uzumaki',
      'Naruto'
    ],
    "42ebf81894cbbe5e1f4cbfdcead2ae451c9ac77c.jpg": ['Luffy', 'One Piece'],
    "5a3434e7cd54382743dc5b6c3c02e8f05e559725.jpg": [
      'Conan Edogawa',
      'Detective Conan'
    ],
  };
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: characters.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 24, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                      'assets/images/${characters.keys.elementAt(index)}'),
                ),
              ),
              Text(
                characters.values.elementAt(index)[0],
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff18153F),
                ),
              ),
              Text(
                characters.values.elementAt(index)[1],
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w600,
                  color: Color(0xffACACAC),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
