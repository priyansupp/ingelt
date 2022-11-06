import 'package:flutter/material.dart';
import 'package:ingelt/shared/constants.dart';
import 'ally_req_group.dart';

class Request extends StatefulWidget {
  const Request({Key? key}) : super(key: key);

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5.0, right: 15.0, left: 15.0),
      color: Colors.white,
      // width: MediaQuery.of(context).size.width*0.8,
      child: Column(
        children: [

          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                if(index == 0) {
                  return const DayWidget(day: 'Today');
                } else if (index == 3) {
                  return const DayWidget(day: 'This Week');
                }
                return const AllyReqGroup();
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class DayWidget extends StatefulWidget {
  final String day;
  const DayWidget({Key? key, required this.day}) : super(key: key);

  @override
  State<DayWidget> createState() => _DayWidgetState();
}

class _DayWidgetState extends State<DayWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        children: [
          Text(
            widget.day,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: AppThemeData.blackishTextColor
            ),
          ),
          const SizedBox(width: 5.0,),
          const Expanded(
            child: Divider(
              thickness: 1.0,
              color: Colors.black54,
            ),
          )
        ],
      ),
    );
  }
}

