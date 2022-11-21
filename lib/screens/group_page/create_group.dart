import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingelt/business_logic/blocs/group_bloc.dart';
import 'package:ingelt/business_logic/blocs/group_event.dart';
import 'package:ingelt/data/models/group_model.dart';
import 'package:ingelt/data/models/profile_model.dart';
import 'package:ingelt/shared/constants.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../business_logic/blocs/user_grpdata_bloc.dart';
import '../../business_logic/blocs/user_grpdata_event.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {


  // controllers
  final TextEditingController _topicController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final currentUser = FirebaseAuth.instance.currentUser;

  final _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();

  var isChecked = false;

  //
  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       initialDatePickerMode: DatePickerMode.day,
  //       firstDate: DateTime(2015),
  //       lastDate: DateTime(2101));
  //   if (picked != null) {
  //     setState(() {
  //       selectedDate = picked;
  //       _dateController.text = DateFormat.yMd().format(selectedDate);
  //     }
  //   );
  //   }
  // }

  @override
  void initState() {
    // _dateController.text = DateTime.now().toString();
    // TODO: implement initState
    super.initState();
  }


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
                    controller: _nameController,
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
                  'Topic',
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
                    // validator: (value) {            // to show frontend form validation error on screen
                    //   if(value == null) {
                    //     return 'Topic can\'t be null.';
                    //   } else {
                    //     return value;
                    //   }
                    // },
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
                      ),
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
                      // DateTimePicker(
                      //   initialValue: '',
                      //   firstDate: DateTime(2000),
                      //   lastDate: DateTime(2100),
                      //   dateLabelText: 'Date',
                      //   onChanged: (val) => print(val),
                      //   validator: (val) {
                      //     print(val);
                      //     return null;
                      //   },
                      //   onSaved: (val) => print(val),
                      // ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.55,
                        height: 40.0,
                        child: Center(
                          child: TextFormField(
                            controller: _dateController,
                            textInputAction: TextInputAction.next,
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.top,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0
                            ),
                            decoration: const InputDecoration(
                              // hintText: 'DD/MM/YY',
                                // alignLabelWithHint: false,
                                // hintStyle: TextStyle(
                                //   color: Colors.white
                                // ),
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
                          controller: _timeController,
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
                  // controller: _descriptionController,
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
                        // if(_formKey.currentState!.validate()) {
                          GroupModel groupModel = GroupModel.fromJson({
                            'GrpName': _nameController.text.trim(),
                            'GrpAdmin': currentUser!.uid,
                            'Time': _timeController.text.trim(),
                            'Date': _dateController.text.trim(),
                            'Participants': [currentUser!.uid],
                            'Topic': _topicController.text.trim(),
                            'Category': 'Education',
                            'Level': 0,
                            'Description': _descriptionController.text.trim(),
                            'GrpId': null,
                          });
                          context.read<GroupBloc>().add(
                              CreateGroupEvent(groupModel: groupModel));
                          context.read<UserGrpDataBloc>().add(
                              GetUserGrpDataEvent(uid: currentUser!.uid));
                          Navigator.of(context).pop();
                        // }
                        // else {
                        //   // Utils.showSnackBar("Please fill all the inputs");
                        //   showTopSnackBar(OverlayState(), const CustomSnackBar.error(
                        //     message:
                        //     'Please fill all the fields!',
                        //   ),);
                        // }
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
