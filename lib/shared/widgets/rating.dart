import 'package:flutter/material.dart';

class Rating extends StatefulWidget {
  final int percentage;
  const Rating({Key? key, required this.percentage}) : super(key: key);

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 21.0,
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: const CircleAvatar(
            radius: 18.0,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.orange,
              child: CircleAvatar(
                radius: 12.0,
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          top: 10.0,
          right: 0.0,
          child: Container(
            color: Colors.white,
            child: Text(
              '${widget.percentage}',
              style: const TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
              ),
            ),
          ),
        )
      ],
    );
  }
}
