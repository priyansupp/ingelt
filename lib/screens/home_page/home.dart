import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:ingelt/models/user_model.dart';
import 'package:ingelt/screens/chat_page/chat.dart';
import 'package:ingelt/screens/group_page/groups.dart';
import 'horizontal_groups.dart';
import 'vertical_groups.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController _searchController = TextEditingController();
  final UserModel user = UserModel(id: '0', name: 'priyanshu', imageUrl: 'assets/person.jpg');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
                SizedBox(
                  height: 45.0,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextField(
                    controller: _searchController,
                    textInputAction: TextInputAction.search,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      fillColor: Colors.lightGreenAccent,
                      filled: true,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                      hintText: 'Search here',
                      border: OutlineInputBorder(     // shows up always, with little light colored border. enabledBorder also always shows up but with dark colored border.
                        borderSide: BorderSide(
                          color:  Theme.of(context).secondaryHeaderColor,   // border color
                          width: 1.0,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                      ),
                      focusedBorder: OutlineInputBorder(  // shows up only when input field is clicked.
                        borderSide: BorderSide(
                          color:  Theme.of(context).secondaryHeaderColor,   // border color
                          width: 1.0,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
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
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Groups()));
                  },
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
