import 'package:flutter/material.dart';
import 'package:ingelt/models/message_model.dart';
import 'package:ingelt/models/user_model.dart';
import 'package:ingelt/shared/widgets/circular_pic.dart';
import 'package:ingelt/shared/constants.dart';

class DM extends StatefulWidget {
  final UserModel user;

  const DM({Key? key, required this.user}) : super(key: key);

  @override
  _DMState createState() => _DMState();
}

class _DMState extends State<DM> {

  _buildMessage(MessageModel message, bool isMe) {
    final Container msg = Container(
      margin: isMe ? const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 110.0,)
          : const EdgeInsets.only(top: 8.0, bottom: 4.0, right: 110.0),

      padding: const EdgeInsets.fromLTRB(13.0, 10.0, 10.0, 10.0),
      // width: MediaQuery.of(context).size.width * 0.65,

      decoration: BoxDecoration(
        color: isMe ? AppThemeData.primaryAppColor : AppThemeData.lightGreyBgColor,
        borderRadius: isMe
            ? const BorderRadius.only(topLeft: Radius.circular(15.0), bottomLeft: Radius.circular(15.0), topRight: Radius.circular(15.0),)
            : const BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0), bottomRight: Radius.circular(15.0),),
      ),


      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const SizedBox(height: 3.0),
          Text(
            message.text,
            style: TextStyle(
              color: isMe ? Colors.white : AppThemeData.blackishTextColor,
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                message.time,
                style: TextStyle(
                  color: isMe ? Colors.white : AppThemeData.blackishTextColor,
                  fontSize: 11.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
    return msg;
  }

  _buildMessageComposer() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
      height: 70.0,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/home_title_bg.jpg',
            ),
            opacity: 0.08,
            fit: BoxFit.cover,
            // colorFilter:
          ),
          color: Colors.white
      ),
      child: Row(
        children: [
          Material(
            elevation: 2.0,
            borderRadius: const BorderRadius.all(Radius.elliptical(50.0, 50.0)),
            clipBehavior: Clip.antiAlias,
            child: Container(
              width: MediaQuery.of(context).size.width - 80.0,    // width - leftpadding - rightpadding - diameter of CircularAvatar
              decoration: BoxDecoration(
                color: AppThemeData.lightGreyBgColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.mic_none_rounded),
                    iconSize: 30.0,
                    color: AppThemeData.blackishTextColor,
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      textCapitalization: TextCapitalization.sentences,
                      onChanged: (value) {},
                      decoration: const InputDecoration.collapsed(
                        hintText: 'Type your message',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.attach_file_rounded),
                    iconSize: 25.0,
                    color: AppThemeData.blackishTextColor,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.camera_alt_outlined),
                    iconSize: 25.0,
                    color: AppThemeData.blackishTextColor,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),

          Material(
            elevation: 2.0,
            shape: const CircleBorder(),
            child: CircleAvatar(
              backgroundColor: AppThemeData.primaryAppColor,
              radius: 30.0,
              child: IconButton(
                icon: const Icon(Icons.send_rounded),
                onPressed: () {},
                iconSize: 25.0,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // appBar
            Container(
              color: AppThemeData.lightGreyBgColor,
              height: 80.0,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),

              child: Stack(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // const SizedBox(width: 15.0,),    // dont remove this
                  Transform.scale(scale: 0.85, child: const CircularPic()),

                  Positioned(
                    left: 70.0,
                    top: 15.0,
                    child: Text(
                      widget.user.displayName,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w700,
                        color: AppThemeData.blackishTextColor,
                      ),
                    ),
                  ),
                  // const SizedBox(width: 50.0,),

                  Positioned(
                    right: 0.0,
                    top: 5.0,
                    child: IconButton(
                      icon: const Icon(Icons.more_vert_rounded),
                      iconSize: 30.0,
                      color: AppThemeData.blackishTextColor,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),


            // main body
            Expanded(       // so that the container takes whole space of the screen
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/home_title_bg.jpg',
                      ),
                      opacity: 0.08,
                      fit: BoxFit.cover,
                      // colorFilter:
                    ),
                    color: Colors.white
                ),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListView.builder(
                    reverse: true,
                    // padding: const EdgeInsets.only(top: 5.0),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final MessageModel message = messages[index];
                      final bool isMe = message.sender.uid == widget.user.uid;
                      return _buildMessage(message, isMe);
                    },
                  ),
                ),
              ),
            ),

            // send message section
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}