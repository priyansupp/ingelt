import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingelt/business_logic/blocs/user_grpdata_bloc.dart';
import 'package:ingelt/business_logic/blocs/user_grpdata_event.dart';
import 'package:ingelt/data/models/user_grpdata_model.dart';
import 'package:ingelt/screens/group_page/admin.dart';
import 'package:ingelt/screens/group_page/ally.dart';
import 'package:ingelt/screens/group_page/request.dart';
import 'package:ingelt/shared/constants.dart';
import '../../business_logic/blocs/user_grpdata_state.dart';

class CreateGroupMainPage extends StatefulWidget {
  const CreateGroupMainPage({Key? key}) : super(key: key);

  @override
  State<CreateGroupMainPage> createState() => _CreateGroupMainPageState();
}

class _CreateGroupMainPageState extends State<CreateGroupMainPage> with TickerProviderStateMixin {

  late TabController _tabController;
  final currentUser = FirebaseAuth.instance.currentUser!;


  @override
  void initState() {
    context.read<UserGrpDataBloc>().add(GetUserGrpDataEvent(uid: currentUser.uid));
    _tabController = TabController(length: 3, vsync: this);
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

    return Column(
      children: [
        Container(
          // padding: const EdgeInsets.symmetric(horizontal: 50.0),
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
          height: 110.0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image(
                          width: 90.0,
                          height: 60.0,
                          image: const AssetImage(
                              'assets/ingelt-logo.png'
                          ),
                          fit: BoxFit.fill,
                          color: AppThemeData.blackishTextColor,
                        ),
                        const SizedBox(width: 5.0,),
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
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert_rounded),
                    color: AppThemeData.blackishTextColor,
                    iconSize: 30.0,
                  )
                ],
              ),

              TabBar(
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
            ],
          ),
        ),

        BlocBuilder<UserGrpDataBloc, UserGrpDataState>(
          builder: (context, state) {
            if(state is UserGrpDataLoadedState) {
              UserGrpDataModel? userGrpDataModel = state.userGrpDataModel;
              return Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    userGrpDataModel != null ? Admin(userGrpDataModel: userGrpDataModel,)  : const SizedBox.shrink(),
                    userGrpDataModel != null ? Ally(userGrpDataModel: userGrpDataModel) : const SizedBox.shrink(),
                    userGrpDataModel != null ? Request(userGrpDataModel: userGrpDataModel) : const SizedBox.shrink(),
                  ],
                ),
              );
            } else if(state is UserGrpDataLoadingState) {
              return const CircularProgressIndicator();
            } else if(state is UserGrpDataErrorState){
              return Center(child: Text(state.error),);
            } else {
              // print(state);
              return const Center(child: Text("Some2 error occurred"),);
            }
          }
        ),
      ],
    );
  }
}
