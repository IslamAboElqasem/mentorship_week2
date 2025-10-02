import 'package:flutter/material.dart';

class CustomRating extends StatelessWidget {
  const CustomRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RatingItem(
            icon: Image.asset(
              'assets/icons/fa-solid_eye.png',
              width: 22,
              height: 22,
            ),
            text: '2.3M views'),
        RatingItem(
            icon: Image.asset(
              'assets/icons/HandsClapping.png',
              width: 22,
              height: 22,
            ),
            text: '2K clap'),
        RatingItem(
            icon: Image.asset(
              'assets/icons/Mask group.png',
              width: 22,
              height: 22,
            ),
            text: '4 Seasons')
      ],
    );
  }
}

class RatingItem extends StatelessWidget {
  final Widget icon;
  final String text;
  const RatingItem({
    super.key,
    required this.icon,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon,
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.white,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
