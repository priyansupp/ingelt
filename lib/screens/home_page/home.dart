import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'horizontal_groups.dart';
import 'vertical_groups.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            color: Colors.white,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Image(
                  width: 70.0,
                  height: 50.0,
                  image: AssetImage(
                      'assets/ingelt-logo.png'
                  ),
                  fit: BoxFit.fill,
                ),
                const Spacer(),
                Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width * 0.6,
                  color: const Color(0xff00ff33),
                  child: TextField(
                    controller: _searchController,
                    textInputAction: TextInputAction.search,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                      hintText: 'Search here',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:  Theme.of(context).secondaryHeaderColor,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.chat_rounded,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const <Widget>[
                HorGroup(),
                HorGroup(),
                HorGroup(),
                HorGroup(),
                HorGroup(),
              ],
            ),
          ),
          const SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GroupButton(
                isRadio: true,
                onSelected: (s, index,selected) => print('$s and $index and $selected'),   // here we fire the fetch
                buttons: const ["Specific", "General"],
              )
            ],
          ),
          Column(
            children: const <Widget>[
              VerGroup(),
              VerGroup(),
              VerGroup(),
              VerGroup(),
              VerGroup(),
            ],
          )
        ],
      ),
    );
  }
}
