import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingelt/business_logic/blocs/user_data_bloc.dart';
import 'package:ingelt/business_logic/blocs/user_data_event.dart';
import 'package:ingelt/business_logic/blocs/user_data_state.dart';
import 'package:ingelt/data/models/group_model.dart';
import 'package:ingelt/data/models/user_data_model.dart';
import 'package:ingelt/shared/constants.dart';
import '../../business_logic/blocs/profile_bloc.dart';
import '../../business_logic/blocs/profile_event.dart';
import '../../business_logic/blocs/profile_state.dart';
import '../../data/models/profile_model.dart';
import '../../shared/widgets/show_group.dart';

class VerGroup extends StatefulWidget {
  final bool onHomePage;
  final GroupModel grpModel;
  const VerGroup({Key? key, required this.onHomePage, required this.grpModel}) : super(key: key);

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
  void initState() {
    context.read<ProfileBloc>().add(GetProfileEvent(uid: widget.grpModel.grpAdmin));
    context.read<UserDataBloc>().add(GetUserDataEvent(uid: widget.grpModel.grpAdmin));
    // TODO: implement initState
    super.initState();
  }

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
                children: [
                  ShowGroup(grpModel: widget.grpModel,),
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
                '| ${widget.grpModel.date}',
              style: customStyle.copyWith(fontSize: 15.0, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 3.0,),
            Text(
                '${widget.grpModel.description}',
              maxLines: 2,
              style: customStyle.copyWith(fontSize: 15.0, fontWeight: FontWeight.w700, overflow: TextOverflow.ellipsis,),
            ),
            Text(
                '${widget.grpModel.category}',
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
          BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
              if (state is ProfileLoadedState) {
                final ProfileModel? profileModel = state.profileModel;
                return profileModel != null ? Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    profileModel.photoURL == null ? const CircleAvatar(
                      // backgroundColor: Colors.black,
                      backgroundImage: AssetImage(
                          'assets/person.jpg'
                      ),
                      radius: 20.0,
                    ) : CircleAvatar(
                      // backgroundColor: Colors.black,
                      backgroundImage: NetworkImage(
                          profileModel.photoURL!
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
                          // widget.admin,
                          '${profileModel.name}',
                          style: customStyle.copyWith(fontSize: 13.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.0),
                        ),
                        Container(
                          // color: Colors.red,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.55,
                          height: 30.0,
                          alignment: Alignment.centerLeft,
                          child: BlocBuilder<UserDataBloc, UserDataState>(
                            builder: (context, state) {
                              if(state is UserDataLoadedState) {
                                UserDataModel? userDataModel = state.userDataModel;
                                return userDataModel != null ?
                                Text(
                                  // '${userDataModel.working}',
                                  // widget.adminDesc,
                                  "Hello I am Priyanshu, the finance non-expert you must never contact for financial advices. However do ping me up for any webdev or appdev query.",
                                  maxLines: 2,
                                  style: customStyle.copyWith(fontSize: 11.0,
                                    fontWeight: FontWeight.w400,
                                    overflow: TextOverflow.ellipsis,),
                                  // style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w700, overflow: TextOverflow.ellipsis,),
                                ) : const SizedBox.shrink();
                              } else if (state is UserDataLoadingState) {
                                return CircularProgressIndicator(color: AppThemeData.primaryAppColor,);
                              } else if (state is UserDataErrorState) {
                                return Center(child: Text(state.error),);
                              } else {
                                print(state);
                                return const Center(child: Text("Some error occurred"),);
                              }
                            }
                          ),
                        ),
                      ],
                    ),

                    const Icon(
                      Icons.verified,
                      color: Colors.white,
                    )
                  ],
                ) : const SizedBox.shrink();
              } else if (state is ProfileLoadingState) {
                return CircularProgressIndicator(color: AppThemeData.primaryAppColor,);
              } else if (state is ProfileErrorState) {
                return Center(child: Text(state.error),);
              } else {
                print(state);
                return const Center(child: Text("Some error occurred"),);
              }
            }
          ),

          ],
        ),
      ),
    );
  }
}
