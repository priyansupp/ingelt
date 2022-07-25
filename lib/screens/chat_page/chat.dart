import 'package:flutter/material.dart';
import 'package:ingelt/models/message_model.dart';
import 'package:ingelt/models/user_model.dart';

class ChatScreen extends StatefulWidget {
  final UserModel user;

  const ChatScreen({Key? key, required this.user}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  _buildMessage(MessageModel message, bool isMe) {
    final Container msg = Container(
      margin: isMe ? const EdgeInsets.only(top: 4.0, bottom: 4.0, left: 80.0,)
          : const EdgeInsets.only(top: 4.0, bottom: 4.0,),
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.75,
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
    if (isMe) {
      return msg;
    }
    return Row(
      children: <Widget>[
        msg,
        IconButton(
          icon: message.isLiked
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border),
          iconSize: 30.0,
          color: message.isLiked
              ? Theme.of(context).primaryColor
              : Colors.blueGrey,
          onPressed: () {},
        )
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.photo),
            iconSize: 25.0,
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
            icon: const Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.user.name,
          style: const TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  // padding: const EdgeInsets.only(top: 5.0),
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    final MessageModel message = messages[index];
                    final bool isMe = message.sender.id == currentUser.id;
                    return _buildMessage(message, isMe);
                  },
                ),
              ),
              _buildMessageComposer(),
            ],
          ),
        ),
      ),
    );
  }
}