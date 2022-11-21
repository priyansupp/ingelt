import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingelt/business_logic/blocs/profile_event.dart';
import 'package:ingelt/business_logic/blocs/user_data_event.dart';
import 'package:ingelt/shared/widgets/circular_pic.dart';
import 'package:ingelt/shared/widgets/rating.dart';
import 'package:ingelt/shared/constants.dart';

import '../../business_logic/blocs/profile_bloc.dart';
import '../../business_logic/blocs/profile_state.dart';
import '../../business_logic/blocs/user_grpdata_bloc.dart';
import '../../business_logic/blocs/user_grpdata_event.dart';
import '../../data/models/group_model.dart';
import '../../data/models/profile_model.dart';
import '../utils.dart';

class ShowGroup extends StatefulWidget {
  final GroupModel? grpModel;
  const ShowGroup({Key? key, required this.grpModel}) : super(key: key);

  @override
  State<ShowGroup> createState() => _ShowGroupState();
}

class _ShowGroupState extends State<ShowGroup> {

  TextStyle customStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  @override
  void initState() {
    context.read<ProfileBloc>().add(GetProfileEvent(uid: widget.grpModel!.grpAdmin));
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0)),
      clipBehavior: Clip.hardEdge,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0))
        ),
        child: Column(
          children: [
            // the white container
            Container(
              height: 100.0,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/ver_grp_bgimage.png',
                  ),
                  fit: BoxFit.fitWidth
                ),
                color: Colors.white,
              ),
            ),

            // the green container
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    opacity: 0.1,
                    image: AssetImage(
                      'assets/home_title_bg.jpg',
                    ),
                    fit: BoxFit.cover,
                    // colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.lighten)
                ),
                gradient: LinearGradient(colors: [
                  const Color.fromRGBO(18, 111, 101, 0.8),
                  AppThemeData.primaryAppColor
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '| ${widget.grpModel!.grpName}',
                        style: const TextStyle(
                          fontSize: 23.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                        ),
                      ),

                      Text(
                        '${widget.grpModel!.date}',
                        style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.white
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10.0,),

                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(
                      '${widget.grpModel!.topic}',
                      // 'Capitalisaition an accounting method in which a cost and which is nade forward through propagation method and delays',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.white,
                        letterSpacing: -0.1
                      ),
                      maxLines: 2,
                    ),
                  ),

                  Divider(
                    thickness: 0.7,
                    color: Colors.white,
                    endIndent: MediaQuery.of(context).size.width*0.5,
                  ),

                  SizedBox(
                    child: Text(
                      '${widget.grpModel!.description}',
                      // 'Capitalisaition an accounting method in which a cost and which is nade forward through propagation method and delays. But what creates delays is the fact that wr can type withouht having a look at the keyboard. Our humna brains havre been trained to adapt to practive and now it doesnt ecen require constant conscious efforts to tyope and find keys netiher to know where to hit.',
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.white,
                          letterSpacing: -0.1
                      ),
                      maxLines: 5,
                    ),
                  ),

                  const SizedBox(height: 15.0,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: <Widget>[
                          Stack(
                            fit: StackFit.passthrough,
                            children: const [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/person.jpg'
                                ),
                                radius: 18.0,
                              ),
                              SizedBox(width: 70.0,),
                              Positioned(
                                left: 15.0,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/person.jpg'
                                  ),
                                  radius: 18.0,
                                ),
                              ),
                              Positioned(
                                left: 30.0,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/person.jpg'
                                  ),
                                  radius: 18.0,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Joined',
                                style: customStyle,
                              ),
                              Text(
                                '12 seats remaining',
                                style: customStyle.copyWith(fontWeight: FontWeight.w400, fontSize: 12.0),
                              ),
                            ],
                          )
                        ],
                      ),

                      SizedBox(
                        height: 38.0,
                        width: 120.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: AppThemeData.lightGreenColor,
                          ),
                          onPressed: () {
                            context.read<UserGrpDataBloc>().add(AddToRequestedToJoinListEvent(grpId: widget.grpModel!.grpId!));
                            Utils.showSnackBar("Request sent");
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Request',
                            style: TextStyle(
                              fontSize: 23.0,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),


                ],
              )
            ),

            const SizedBox(height: 2,),   // works as horizontal divider between two containers

            // const Divider(
            //   color: Colors.white,
            //   thickness: 0.1,
            // ),

            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoadedState) {
                  final ProfileModel? profileModel = state.profileModel;
                  return profileModel != null ? Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          opacity: 0.1,
                          image: const AssetImage(
                            'assets/home_title_bg.jpg',
                          ),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              AppThemeData.primaryAppColor, BlendMode.lighten)
                      ),
                    ),
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 15),
                    child: Stack(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                            backgroundColor: Colors.white,
                              radius: 32.0,
                              child: profileModel.photoURL != null ?
                              ClipOval(
                                child: Image.network(
                                  profileModel.photoURL!,
                                  width: 115.0,
                                  height: 115.0,
                                  fit: BoxFit.cover,
                                ),
                              )
                                  :
                              // const SizedBox.shrink()
                              Icon(
                                Icons.photo_camera,
                                color: AppThemeData
                                    .blackishTextColor,
                                size: 30.0,
                              ),
                            ),
                            Positioned(
                              bottom: -2.0,
                              left: 7.0,
                              child: Container(
                                height: 15.0,
                                width: 50.0,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(50.0, 50.0)),
                                  color: Color.fromRGBO(18, 100, 101, 1),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Admin',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.0
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),

                        Positioned(
                          left: 70.0,
                          bottom: 0.0,
                          top: 0.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${profileModel.name}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600
                                ),
                              ),

                              Text(
                                '${profileModel.designation} | ${profileModel.company}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ],
                          ),
                        ),

                        const Positioned(
                            right: 0.0, bottom: 0.0, top: 6.0, child: Rating(
                            percentage: 45)),
                      ],
                    ),
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
            )
          ],
        )
      ),
    );
  }
}
