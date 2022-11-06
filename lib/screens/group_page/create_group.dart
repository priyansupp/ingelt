import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ingelt/models/group_model.dart';
import 'package:ingelt/models/user_model.dart';
import 'package:ingelt/shared/constants.dart';
import 'package:ingelt/shared/utils.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {

  final UserModel groupAdmin = groups[0].admin;

  // controllers
  final TextEditingController _topicController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  var isChecked = false;


  @override
  Widget build(BuildContext context) {

    // states for checkbox
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return const Color(0xEE023020);
    }

    return
      ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0)),
        clipBehavior: Clip.hardEdge,
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              opacity: 0.1,
              image: AssetImage(
                'assets/home_title_bg.jpg',
              ),
              fit: BoxFit.cover,
              // colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.lighten)
            ),
            gradient: LinearGradient(colors: [
              Colors.green,
              Colors.greenAccent
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter),

          ),
          padding: const EdgeInsets.fromLTRB(30, 15, 30, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Create Group',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                       color: Colors.white,
                      letterSpacing: 0.5
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2.0,),
              Divider(
                thickness: 1.5,
                color: Colors.white,
                indent: MediaQuery.of(context).size.width*0.35,
                endIndent: MediaQuery.of(context).size.width*0.35,
              ),

              // const SizedBox(height: 10.0,),

              Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                child: const Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.white
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 40.0,
                child: Center(
                  child: TextFormField(
                    controller: _topicController,
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.top,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0
                    ),
                    decoration: const InputDecoration(
                      fillColor: Color(0xEE023020),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                      )
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10.0,),


              Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                child: const Text(
                  'Description',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.white
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: TextFormField(
                  maxLines: 4,
                  controller: _descriptionController,
                  textInputAction: TextInputAction.newline,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.top,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0
                  ),
                  decoration: const InputDecoration(
                      fillColor: Color(0xEE023020),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                      )
                  ),
                ),
              ),

              const SizedBox(height: 10.0,),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                        child: const Text(
                          'Date',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.white
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.55,
                        height: 40.0,
                        child: TextFormField(
                          controller: _topicController,
                          textInputAction: TextInputAction.next,
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.top,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16.0
                          ),
                          decoration: const InputDecoration(
                              fillColor: Color(0xEE023020),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.0,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                        child: const Text(
                          'Time',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.white
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: 40.0,
                        child: TextFormField(
                          controller: _topicController,
                          textInputAction: TextInputAction.next,
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.top,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16.0
                          ),
                          decoration: const InputDecoration(
                              fillColor: Color(0xEE023020),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.0,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                              )
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),

              const SizedBox(height: 10.0,),


              Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                child: const Text(
                  'Invite Connections',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.white
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 40.0,
                child: TextFormField(
                  controller: _descriptionController,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.top,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0
                  ),
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.search, color: Colors.white, size: 30.0,),
                      fillColor: Color(0xEE023020),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                      )
                  ),
                ),
              ),

              const SizedBox(height: 10.0,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      'Invite Researchers (Rs. 100)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19.0,
                        letterSpacing: -0.5,
                        color: Colors.greenAccent
                      ),
                    ),
                  ),

                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateColor.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  )
                ],
              ),

              const SizedBox(height: 10.0,),

              // ElevatedButton.icon(
              //   onPressed: () async {
              //     Navigator.of(context).pop();
              //     // await FirebaseAuth.instance.signOut();
              //   },      // signs in to home page
              //   icon: const Icon(
              //     Icons.group_add_outlined,
              //     color: Colors.white,
              //   ),
              //   label: const Text(
              //     'Create Group',
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 15.0,
              //     ),
              //   ),
              //   style: ElevatedButton.styleFrom(
              //     minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 60.0),
              //     backgroundColor: Theme.of(context).colorScheme.secondary,
              //     shape: const StadiumBorder(),
              //   ),
              // ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40.0,
                    width: 130.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder()
                      ),
                      onPressed: () {

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
            ],
          ),
        ),
      );
  }
}
