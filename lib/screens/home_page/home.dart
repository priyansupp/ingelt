import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingelt/data/models/profile_model.dart';
import 'package:ingelt/screens/home_page/fetch_hor.dart';
import 'package:ingelt/screens/search_page/search_home.dart';
import '../../business_logic/blocs/profile_bloc.dart';
import '../../business_logic/blocs/profile_event.dart';
import 'fetch_general.dart';
import 'fetch_specific.dart';
import 'package:ingelt/shared/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {

  late TabController _tabController;
  final currentUser = FirebaseAuth.instance.currentUser;


  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
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
                opacity: 0.2,
                fit: BoxFit.cover
              ),
            ),
            width: MediaQuery.of(context).size.width,
            // color: Colors.white,
            child: Row(
              children: [
                Image(
                  width: 85.0,
                  height: 50.0,
                  image: const AssetImage(
                      'assets/ingelt-logo.png'
                  ),
                  fit: BoxFit.fill,
                  color: AppThemeData.blackishTextColor,
                ),

                const SizedBox(width: 10.0,),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchHome()));
                    },
                    child: SizedBox(
                      height: 35.0,
                      // width: MediaQuery.of(context).size.width * 0.75,
                      child: Material(
                        elevation: 4.0,
                        shadowColor: Colors.grey,
                        shape: const StadiumBorder(),
                        // borderRadius: const BorderRadius.all(Radius.circular(40.0)),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(2.0)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search,
                                color: AppThemeData.blackishTextColor,
                                size: 20.0,
                              ),

                              const SizedBox(width: 5.0,),

                              const Text(
                                'Ingelt Xplore',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),

                            ],
                          ),
                        )
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

          Container(
            height: 10.0,
            width: MediaQuery.of(context).size.width,
            color: AppThemeData.lightGreyBgColor,
          ),

          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                TabBar(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  labelColor: AppThemeData.blackishTextColor,
                  labelStyle: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                  indicatorColor: AppThemeData.secondaryAppColor,
                  // indicatorColor: Color.fromRGBO(129, 188, 183, 1),
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
