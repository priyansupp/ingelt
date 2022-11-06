import 'package:flutter/material.dart';
import 'package:ingelt/shared/constants.dart';
import '../../shared/widgets/show_group.dart';

class VerGroup extends StatefulWidget {
  final String date, desc, category, admin, adminDesc;
  final bool onHomePage;
  const VerGroup({Key? key, required this.date, required this.desc, required this.category, required this.admin, required this.adminDesc, required this.onHomePage}) : super(key: key);

  @override
  State<VerGroup> createState() => _VerGroupState();
}

class _VerGroupState extends State<VerGroup> {

  TextStyle customStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            isScrollControlled: true,
            context: context, 
            builder: (BuildContext context) {
              return Wrap(    // to control height of the modalsheetbottom(according to its content)
                children: const [
                  ShowGroup(),
                ],
              );
            }
        );
      },
      child: Container(
        margin: widget.onHomePage ? const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0) : const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
        padding: widget.onHomePage ? const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0, bottom: 10.0) : const EdgeInsets.only(left: 5.0, right: 5.0, top: 0.0, bottom: 0.0),
        height: 210.0,
        width: MediaQuery.of(context).size.width * 0.84,
        decoration: BoxDecoration(
            borderRadius: widget.onHomePage ? const BorderRadius.all(Radius.circular(30.0)) : const BorderRadius.all(Radius.circular(15.0)),
            gradient: LinearGradient(colors: [
              // AppThemeData.primaryAppColor,
              const Color.fromRGBO(18, 125, 101, 0.8),
              AppThemeData.primaryAppColor
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                '| ${widget.date}',
              style: customStyle.copyWith(fontSize: 15.0, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 3.0,),
            Text(
                widget.desc,
              maxLines: 2,
              style: customStyle.copyWith(fontSize: 15.0, fontWeight: FontWeight.w700, overflow: TextOverflow.ellipsis,),
            ),
            Text(
                widget.category,
              style: customStyle.copyWith(fontSize: 12.0, fontWeight: FontWeight.w400, letterSpacing: 1.0),
            ),
            const SizedBox(height: 3.0,),
            Row(
              children: <Widget>[
                Stack(
                  fit: StackFit.passthrough,
                  children: const [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/person.jpg'
                      ),
                      radius: 15.0,
                    ),
                    SizedBox(width: 70.0,),
                    Positioned(
                      left: 15.0,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/person.jpg'
                        ),
                        radius: 15.0,
                      ),
                    ),
                    Positioned(
                      left: 30.0,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/person.jpg'
                        ),
                        radius: 15.0,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Joined',
                      style: customStyle.copyWith(fontSize: 12.0),
                    ),
                    Text(
                        '12 seats remaining',
                      style: customStyle.copyWith(fontWeight: FontWeight.w400, fontSize: 10.0),
                    ),
                  ],
                )
              ],
            ),
            const Divider(
              color: Colors.white,
              thickness: 1.5,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const CircleAvatar(
                  // backgroundColor: Colors.black,
                  backgroundImage: AssetImage(
                      'assets/person.jpg'
                    ),
                  radius: 20.0,
                ),
                const SizedBox(width: 10.0,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                        widget.admin,
                      style: customStyle.copyWith(fontSize: 13.0, fontWeight: FontWeight.w600, letterSpacing: 0.0),
                    ),
                    Container(
                      // color: Colors.red,
                      width: MediaQuery.of(context).size.width*0.55,
                      height: 30.0,
                      alignment: Alignment.center,
                      child: Text(
                        widget.adminDesc,
                        // "Hello I am Priyanshu, the finance non-expert you must never contact for financial advices. However do ping me up for any webdev or appdev query.",
                        maxLines: 2,
                        style: customStyle.copyWith(fontSize: 11.0, fontWeight: FontWeight.w400, overflow: TextOverflow.ellipsis,),
                        // style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w700, overflow: TextOverflow.ellipsis,),
                      ),
                    ),
                  ],
                ),

                const Icon(
                  Icons.verified,
                  color: Colors.white,
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
