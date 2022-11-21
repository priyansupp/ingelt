import 'package:flutter/material.dart';
import '../../business_logic/blocs/user_grpdata_bloc.dart';
import '../../data/models/user_grpdata_model.dart';
import 'ally_req_group.dart';

class Ally extends StatefulWidget {
  final UserGrpDataModel? userGrpDataModel;
  const Ally({Key? key, required this.userGrpDataModel}) : super(key: key);

  @override
  State<Ally> createState() => _AllyState();
}

class _AllyState extends State<Ally> {

  @override
  Widget build(BuildContext context) {
    print(widget.userGrpDataModel);
    return Container(
      padding: const EdgeInsets.only(top: 10.0, right: 15.0, left: 15.0),
      color: Colors.white,
      width: MediaQuery.of(context).size.width*0.8,
      child: widget.userGrpDataModel != null ? widget.userGrpDataModel?.joined != null ? ListView.builder(
        itemBuilder: (context, index) {
          return AllyReqGroup(grpId: widget.userGrpDataModel?.joined![index], isAlly: true);
        },
        itemCount: widget.userGrpDataModel?.joined!.length,

      ) : const SizedBox.shrink()
          : const SizedBox.shrink()
    );
  }
}

