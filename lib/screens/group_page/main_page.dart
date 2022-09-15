import 'package:flutter/material.dart';
import 'package:ingelt/models/user_model.dart';
import 'package:ingelt/screens/group_page/admin.dart';
import 'package:ingelt/screens/group_page/groups.dart';

import '../home_page/vertical_groups.dart';
import 'create_group.dart';

class CreateGroupMainPage extends StatefulWidget {
  const CreateGroupMainPage({Key? key}) : super(key: key);

  @override
  State<CreateGroupMainPage> createState() => _CreateGroupMainPageState();
}

class _CreateGroupMainPageState extends State<CreateGroupMainPage> with TickerProviderStateMixin {

  late TabController _tabController;
  bool adminGroupCreated = false;


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
          height: 80.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [
                  Image(
                    width: 100.0,
                    height: 60.0,
                    image: AssetImage(
                        'assets/ingelt-logo.png'
                    ),
                    fit: BoxFit.fill,
                  ),
                  Text(
                    'Discussion',
                    style: TextStyle(
                      fontSize: 17.5,
                      fontWeight: FontWeight.w600,
                      height: -0.01
                    ),
                  ),
                  SizedBox(
                    width: 110.0,
                    child: Divider(
                      thickness: 1.0,
                      color: Colors.black,
                    ),
                  )
                ],
              ),

              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert_rounded),
                color: Colors.black,
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
                  opacity: 0.15,
                  fit: BoxFit.cover
              )
          ),
          child: TabBar(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            // labelColor: Theme.of(context).colorScheme.primary,
            labelStyle: const TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.w500,
                color: Colors.grey
            ),
            indicatorColor: Theme.of(context).colorScheme.primary,
            indicatorWeight: 2.5,
            controller: _tabController,
            // onTap: () {},
            tabs: const <Widget>[
              Tab(
                text: 'Admin',
              ),
              Tab(
                text: 'Ally',
              ),
              Tab(
                text: 'Request',
              ),
            ],
          ),
        ),


        SizedBox(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height - 213,
          // height: 1000.0,
          child: TabBarView(
            controller: _tabController,
            children: [
              adminGroupCreated ? const Admin():
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height*0.5,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 40.0,),
                              const Text(
                                'Make Your Own Niche',
                                style: TextStyle(
                                  fontSize: 17.5,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w300
                                ),
                              ),
                              const SizedBox(height: 20.0,),
                              SizedBox(
                                height: 50.0,
                                width: 140.0,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder()
                                  ),
                                  onPressed: () {
                                    showModalBottomSheet<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const CreateGroup();
                                        },
                                    );
                                  },
                                  child: const Text(
                                    'Create',
                                    style: TextStyle(
                                      fontSize: 23.0,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 6.0,),    // greyish gap in between Active and Previous Groups

                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.fromLTRB(20.0, 15.0, 15.0, 0.0),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Previous Groups',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    letterSpacing: 1.0
                                ),
                              ),

                              SizedBox(
                                height: 250.0,
                                child: ListView.builder(
                                  // padding: const EdgeInsets.symmetric(horizontal: 10.0),     // gives padding to the list not the items
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Row(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Transform.scale(scale: 0.8, alignment: Alignment.centerLeft, child: const VerGroup(date: '22nd July 2022', desc: "Ather's smart electric scooters with best-in-class settings to deal with.", category: 'Automobile', admin: 'Priyanshu Jaiswal', adminDesc: 'An aspiring app developer, and a web developer in making')),
                                        // SizedBox(width: 10.0,),
                                      ],
                                    );
                                  },
                                  itemCount: 5,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
              // Center(
              //   child: SizedBox(
              //     height: 70.0,
              //     width: 200.0,
              //     child: ElevatedButton.icon(
              //       onPressed: () {
              //         showModalBottomSheet<void>(
              //             context: context,
              //             builder: (BuildContext context) {
              //               return const CreateGroup();
              //             },
              //         );
              //       },
              //       icon: const Icon(
              //         Icons.group_add_rounded
              //       ),
              //       label: const Text(
              //         'Create Group',
              //         style: TextStyle(
              //           fontSize: 20.0,
              //           fontWeight: FontWeight.w600
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              const Text('ally'),
              const Text('request')
            ],
          ),
        ),
      ],
    );
  }
}
