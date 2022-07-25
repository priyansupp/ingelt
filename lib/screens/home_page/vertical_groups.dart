import 'package:flutter/material.dart';

class VerGroup extends StatefulWidget {
  const VerGroup({Key? key}) : super(key: key);

  @override
  State<VerGroup> createState() => _VerGroupState();
}

class _VerGroupState extends State<VerGroup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      height: 250.0,
      width: MediaQuery.of(context).size.width*0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.green
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0.0,
            right: 0.0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            ),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            width: MediaQuery.of(context).size.width,
            height: 230.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    '22nd Jul 2022'
                ),
                Text(
                    'Heading'
                ),
                Text(
                    'Category'
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Joined connections',
                    ),
                    Text(
                        '12 seats remaining'
                    )
                  ],
                ),
                Divider(
                  color: Theme.of(context).secondaryHeaderColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          // backgroundImage: ,
                          radius: 20.0,
                        ),
                        const SizedBox(width: 17.0,),
                        const Text(
                            'Priyanshu Jaiswal'
                        ),
                      ],
                    ),
                    Container(
                        child: const Text(
                          'Admin',
                        )
                    )
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: const Text(
                    'Hello I am priyanshu, the finance non-expert you must never conatct for financial advices. However do ping me up for any webdev or appdev query.',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}
