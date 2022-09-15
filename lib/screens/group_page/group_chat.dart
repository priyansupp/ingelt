import 'package:flutter/material.dart';
import 'package:ingelt/models/group_model.dart';
import 'package:ingelt/models/message_model.dart';
import 'package:ingelt/models/user_model.dart';

class GroupChat extends StatefulWidget {
  final GroupModel group;

  const GroupChat({Key? key, required this.group}) : super(key: key);

  @override
  _GroupChatState createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
          color: Theme.of(context).secondaryHeaderColor,
        ),
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                widget.group.imageUrl,
              ),
              radius: 20.0,
            ),
            const Spacer(),
            Center(
              child: Text(
                widget.group.name,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 55.0,
              width: 100.0,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add_chart),
                label: const Text('Invite'),
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                ),
              ),
            ),
            const SizedBox(width: 5.0,),
          ],
        ),
        elevation: 0.0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                reverse: true,
                // padding: const EdgeInsets.only(top: 5.0),
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  final MessageModel message = messages[index];
                  final bool isMe = message.sender.uid == widget.group.admin.uid;
                  final double gapBySide = MediaQuery.of(context).size.width * 0.3;
                  return _buildMessage(message, isMe, gapBySide);
                },
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }

  _buildMessage(MessageModel message, bool isMe, double gapBySide) {
    final Container msg = Container(
      margin: isMe ? EdgeInsets.only(top: 4.0, bottom: 4.0, left: gapBySide, right: 8.0,)
          : EdgeInsets.only(top: 4.0, bottom: 4.0, left: 8.0, right: gapBySide),
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        color: isMe ? Theme.of(context).colorScheme.primary : Theme.of(context).secondaryHeaderColor,
        borderRadius: isMe
            ? const BorderRadius.only(topLeft: Radius.circular(15.0), bottomLeft: Radius.circular(15.0),)
            : const BorderRadius.only(topRight: Radius.circular(15.0), bottomRight: Radius.circular(15.0),),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.time,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 12.0,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            message.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
    // if (isMe) {
    //   return msg;
    // }
    return msg;
    // return Row(
    //   children: <Widget>[
    //     msg,
    //     IconButton(
    //       icon: message.isLiked
    //           ? const Icon(Icons.notification_important_sharp)
    //           : const Icon(Icons.notification_important_outlined),
    //       iconSize: 30.0,
    //       color: message.isLiked
    //           ? Theme.of(context).primaryColor
    //           : Colors.blueGrey,
    //       onPressed: () {},
    //     )
    //   ],
    // );
  }

  _buildMessageComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 7.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 60.0,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.elliptical(50.0, 50.0)),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_photo_alternate_rounded),
            iconSize: 30.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {},
              decoration: const InputDecoration.collapsed(
                hintText: 'Send a message...',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.keyboard_voice_rounded),
            iconSize: 30.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.send),
            iconSize: 30.0,
            color: Theme.of(context).secondaryHeaderColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}