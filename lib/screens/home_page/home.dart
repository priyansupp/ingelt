import 'package:flutter/material.dart';
import 'package:ingelt/models/user_model.dart';
import 'package:ingelt/screens/home_page/fetch_hor.dart';
import 'fetch_general.dart';
import 'fetch_specific.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {

  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;
  final UserModel user = UserModel(uid: '0', displayName: 'priyanshu', photoURL: 'assets/person.jpg', phone: '9643763504', emailAddress: 'priyanshu@iitg.ac.in');
  

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 13.0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/home_title_bg.jpg',
                ),
                opacity: 0.15,
                fit: BoxFit.cover
              ),
            ),
            width: MediaQuery.of(context).size.width,
            // color: Colors.white,
            child: Row(
              children: [
                const Image(
                  width: 85.0,
                  height: 50.0,
                  image: AssetImage(
                      'assets/ingelt-logo.png'
                  ),
                  fit: BoxFit.fill,
                  color: Color(0xEE5A5A5A),
                ),
                const SizedBox(width: 10.0,),
                Expanded(
                  child: SizedBox(
                    height: 35.0,
                    // width: MediaQuery.of(context).size.width * 0.75,
                    child: Material(
                      elevation: 2.0,
                      shadowColor: Colors.grey,
                      shape: const StadiumBorder(),
                      // borderRadius: const BorderRadius.all(Radius.circular(40.0)),
                      child: TextField(
                        controller: _searchController,
                        textInputAction: TextInputAction.search,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 70.0, right: 10.0),
                            child: Icon(
                              Icons.search,
                              color: Theme.of(context).secondaryHeaderColor,
                              size: 20.0,
                            ),
                          ),
                          hintText: 'Ingelt Xplore',
                          hintStyle: const TextStyle(
                            fontSize: 16.0,
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0.0,
                              style: BorderStyle.none
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 0.0,
                                style: BorderStyle.none
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          )

                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0,),
              ],
            ),
          ),
          Container(
            // color: Colors.white,
            height: 170.0,
            padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
            child: const FetchHor()
          ),
          // const SizedBox(height: 3.0,),
          Container(
            height: 10.0,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFFD3D3D3),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     GroupButton(
                //       isRadio: true,
                //       onSelected: (s, index, selected) => print('$s and $index and $selected'),   // here we fire the fetch
                //       buttons: const ["Specific", "General"],
                //       options: GroupButtonOptions(
                //         selectedColor: Colors.white,
                //         selectedBorderColor: Theme.of(context).colorScheme.primary,
                //         selectedTextStyle: TextStyle(
                //           color: Colors.grey
                //         )
                //       ),
                //     )
                //   ],
                // ),
                TabBar(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  // labelColor: Theme.of(context).colorScheme.primary,
                  labelStyle: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey
                  ),
                  indicatorColor: Theme.of(context).colorScheme.primary,
                  indicatorWeight: 2.5,
                  controller: _tabController,
                  // onTap: () {},
                  tabs: const <Widget>[
                    Tab(
                      text: 'Specific',
                    ),
                    Tab(
                      text: 'General',
                    ),
                  ],
                ),

              ],
            ),
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                FetchSpecific(),
                FetchGeneral(),
              ],
            ),
          ),

        ],
      ),
    );
  }

}
