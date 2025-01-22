import 'package:flutter/material.dart';

class StarsComponent extends StatelessWidget {
  final int rating;

  const StarsComponent({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];

    for (int i = 0; i < rating; i++) {
      stars.add(const Icon(
        Icons.star,
        color: Colors.amber,
        size: 20,
      ));
    }

    for (int i = rating; i < 5; i++) {
      stars.add(const Icon(
        Icons.star_border,
        color: Colors.amber,
        size: 20,
      ));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: stars,
    );
  }
}
