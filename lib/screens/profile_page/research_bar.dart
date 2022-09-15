import 'package:flutter/material.dart';


class ResearchBar extends StatefulWidget {
  final double percentage;
  final String text;
  const ResearchBar({Key? key, required this.percentage, required this.text}) : super(key: key);

  @override
  State<ResearchBar> createState() => _ResearchBarState();
}

class _ResearchBarState extends State<ResearchBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          // color: Theme.of(context).scaffoldBackgroundColor,
          width: MediaQuery.of(context).size.width * 0.75,
          height: 33.0,
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
          alignment: Alignment.topLeft,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * widget.percentage / 100,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
            ),
            padding: const EdgeInsets.only(left: 20.0),
            alignment: Alignment.centerLeft,
            child: Text(
              widget.text,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0
              ),
            ),
          ),
          // child: Text('GRAPHIC DESIGN'),
        ),
        const SizedBox(width: 8.0,),
        Text(
          '${widget.percentage}%',
          style: const TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }
}
