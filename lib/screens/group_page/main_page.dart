import 'package:flutter/material.dart';
import 'package:ingelt/models/user_model.dart';
import 'package:ingelt/screens/group_page/admin.dart';
import 'package:ingelt/screens/group_page/ally.dart';
import 'package:ingelt/screens/group_page/request.dart';
import 'package:ingelt/shared/constants.dart';
import '../home_page/vertical_groups.dart';

class CreateGroupMainPage extends StatefulWidget {
  const CreateGroupMainPage({Key? key}) : super(key: key);

  @override
  State<CreateGroupMainPage> createState() => _CreateGroupMainPageState();
}

class _CreateGroupMainPageState extends State<CreateGroupMainPage> with TickerProviderStateMixin {

  late TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/home_title_bg.jpg',
                  ),
                  opacity: 0.15,
                  fit: BoxFit.cover
              )
          ),
          width: MediaQuery.of(context).size.width,
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image(
                    width: 90.0,
                    height: 60.0,
                    image: AssetImage(
                        'assets/ingelt-logo.png'
                    ),
                    fit: BoxFit.fill,
                    color: AppThemeData.blackishTextColor,
                  ),
                  SizedBox(width: 5.0,),
                  Text(
                    'Connect',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      height: -1.0,
                      color: AppThemeData.blackishTextColor
                    ),
                  ),
                ],
              ),

              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert_rounded),
                color: AppThemeData.blackishTextColor,
                iconSize: 30.0,
              )
            ],
          ),
        ),

        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/home_title_bg.jpg',
                  ),
                  opacity: 0.20,
                  fit: BoxFit.cover
              )
          ),
          child: TabBar(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            labelColor: AppThemeData.blackishTextColor,
            labelStyle: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w800,
            ),
            indicatorColor: AppThemeData.primaryAppColor,
            indicatorWeight: 2.5,
            controller: _tabController,
            // onTap: () {},
            tabs: const <Widget>[
              Tab(
                text: 'Admin',
              ),
              Tab(
                text: 'Allies',
              ),
              Tab(
                text: 'Requests',
              ),
            ],
          ),
        ),


        SizedBox(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height - 193,
          // height: 1000.0,
          child: TabBarView(
            controller: _tabController,
            children: const [
              Admin(),
              Ally(),
              Request()
            ],
          ),
        ),
      ],
    );
  }
}
