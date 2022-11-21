import 'package:flutter/material.dart';
import 'package:ingelt/shared/constants.dart';


class ForteBar extends StatefulWidget {
  final int percentage;
  final String text;
  const ForteBar({Key? key, required this.percentage, required this.text}) : super(key: key);

  @override
  State<ForteBar> createState() => _ForteBarState();
}

class _ForteBarState extends State<ForteBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          // color: Theme.of(context).scaffoldBackgroundColor,
          width: MediaQuery.of(context).size.width * 0.80,
          height: 25.0,
          decoration: BoxDecoration(
            color: AppThemeData.lightGreyBgColor,
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
          ),
          alignment: Alignment.topLeft,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * widget.percentage / 100,
            decoration: BoxDecoration(
              // color: AppThemeData.primaryAppColor,
              gradient: LinearGradient(
                colors: [
                  AppThemeData.primaryAppColor,
                  const Color.fromRGBO(18, 140, 101, 0.7),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight
              ),
              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
            ),
            padding: const EdgeInsets.only(left: 20.0),
            alignment: Alignment.centerLeft,
            child: Text(
              widget.text,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 12
              ),
            ),
          ),
          // child: Text('GRAPHIC DESIGN'),
        ),
        const SizedBox(width: 8.0,),
        Text(
          '${widget.percentage}%',
          style: TextStyle(
              color: AppThemeData.blackishTextColor,
              fontSize: 15.0,
              fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }
}
