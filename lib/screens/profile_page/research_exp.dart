import 'package:flutter/material.dart';
import 'package:ingelt/shared/widgets/rating.dart';

class ResearchExp extends StatefulWidget {
  final String topic;
  final int percentage;
  final String company;
  final String startDate;
  final String endDate;
  const ResearchExp({Key? key, required this.topic, required this.percentage, required this.company, required this.startDate, required this.endDate}) : super(key: key);

  @override
  State<ResearchExp> createState() => _ResearchExpState();
}

class _ResearchExpState extends State<ResearchExp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          color: Colors.white,
          height: 70.0,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/ingelt-logo.png',
                ),
                radius: 30,
              ),
              const SizedBox(width: 5.0,),
              VerticalDivider(
                thickness: 3.0,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 5.0,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.topic,
                      style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.black
                      ),
                    ),
                    const Divider(
                      thickness: 1.5,
                      color: Colors.grey,
                    ),
                    Text(
                      widget.company,
                      style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                      ),
                    ),
                    // const SizedBox(height: 3.0,),
                    Text(
                      '${widget.startDate} - ${widget.endDate}, 3 mos',
                      style: const TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey
                      ),
                    ),
                    const SizedBox(height: 3.0,),
                  ],
                ),
              ),
              const SizedBox(width: 13.0,),
              Rating(percentage: widget.percentage),
              const SizedBox(width: 20.0,),   // gap after the rating-circle
            ],
          )
        ),

        const SizedBox(height: 20.0,),
      ],
    );
  }
}
