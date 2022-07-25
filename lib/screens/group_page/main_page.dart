import 'package:flutter/material.dart';
import 'package:ingelt/models/user_model.dart';
import 'package:ingelt/screens/group_page/groups.dart';

import 'create_group.dart';

class CreateGroupMainPage extends StatefulWidget {
  const CreateGroupMainPage({Key? key}) : super(key: key);

  @override
  State<CreateGroupMainPage> createState() => _CreateGroupMainPageState();
}

class _CreateGroupMainPageState extends State<CreateGroupMainPage> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          Container(
            height: 150.0,
            width: MediaQuery.of(context).size.width,
            // color: Colors.red,
            child: Center(
              child: SizedBox(
                height: 50.0,
                width: 200.0,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // print('button pressed');
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreateGroup()));
                  },
                  icon: Icon(Icons.group_add_rounded),
                  label: const Text('Create Group'),
                ),
              ),
            ),
          ),
          Groups(groupIndex: 0,),
          Groups(groupIndex: 1,),
          Groups(groupIndex: 2,),
          Groups(groupIndex: 3,),
          Groups(groupIndex: 4,),
          Groups(groupIndex: 5,),
          Groups(groupIndex: 2,),
          Groups(groupIndex: 2,),
          Groups(groupIndex: 1,),
          Groups(groupIndex: 4,),
        ],
      ),
    );
  }
}
