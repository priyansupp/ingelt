import 'package:flutter/material.dart';
import 'package:ingelt/models/message_model.dart';
import 'package:ingelt/models/user_model.dart';
import 'package:ingelt/shared/widgets/circular_pic.dart';

class ChatScreen extends StatefulWidget {
  final UserModel user;

  const ChatScreen({Key? key, required this.user}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  _buildMessage(MessageModel message, bool isMe) {
    final Container msg = Container(
      margin: isMe ? const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 110.0,)
          : const EdgeInsets.only(top: 4.0, bottom: 4.0,),

      padding: const EdgeInsets.fromLTRB(13.0, 10.0, 10.0, 10.0),
      width: MediaQuery.of(context).size.width * 0.65,

      decoration: BoxDecoration(
        color: isMe ? Theme.of(context).colorScheme.primary : Colors.grey,
        borderRadius: isMe
            ? const BorderRadius.only(topLeft: Radius.circular(15.0), bottomLeft: Radius.circular(15.0), topRight: Radius.circular(15.0),)
            : const BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0), bottomRight: Radius.circular(15.0),),
      ),


      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              isMe ? const SizedBox.shrink() : Text(
                '${message.sender.displayName} | ',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              isMe ? const SizedBox.shrink() : Text(
                'Marketing',
                // message.sender.category,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          const SizedBox(height: 3.0),
          Text(
            message.text,
            style: TextStyle(
              color: isMe ? Colors.white : Colors.black,
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
                  color: isMe ? Colors.white : Colors.black,
                  fontSize: 11.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        const CircleAvatar(
          backgroundImage: AssetImage(
            'assets/ingelt-logo.png',
          ),
          radius: 25.0,
        ),
        const SizedBox(width: 7.0,),
        msg,
        // IconButton(
        //   icon: message.isLiked
        //       ? const Icon(Icons.favorite)
        //       : const Icon(Icons.favorite_border),
        //   iconSize: 30.0,
        //   color: message.isLiked
        //       ? Theme.of(context).primaryColor
        //       : Colors.blueGrey,
        //   onPressed: () {},
        // )
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
      height: 65.0,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Row(
        children: [
          Material(
            elevation: 2.0,
            borderRadius: const BorderRadius.all(Radius.elliptical(50.0, 50.0)),
            clipBehavior: Clip.antiAlias,
            child: Container(
              width: MediaQuery.of(context).size.width - 80.0,    // width - leftpadding - rightpadding - diameter of CircularAvatar
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.mic_none_rounded),
                    iconSize: 30.0,
                    color: Colors.black,
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
                    color: Colors.black,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.camera_alt_outlined),
                    iconSize: 25.0,
                    color: Colors.black,
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
              backgroundColor: Theme.of(context).colorScheme.primary,
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
    return Column(
      children: [
        // appBar
        Container(
          color: Colors.grey,
          height: 90.0,
          width: MediaQuery.of(context).size.width,

          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 15.0,),    // dont remove this
              Transform.scale(scale: 0.9, child: const CircularPic()),
              const SizedBox(width: 10.0,),
              Text(
                widget.user.displayName,
                style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.black
                ),
              ),
              const SizedBox(width: 50.0,),
              SizedBox(
                height: 25.0,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      shape: const StadiumBorder(),
                      side: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1.5
                      )
                  ),
                  child: const Text(
                    'Researcher',
                    style: TextStyle(
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.info_outline),
                iconSize: 22.0,
                color: Theme.of(context).colorScheme.primary,
                onPressed: () {},
              ),
            ],
          ),
        ),


        // main body
        Expanded(       // so that the container takes whole space of the screen
          child: Container(
            color: Colors.white,
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
    );
  }
}