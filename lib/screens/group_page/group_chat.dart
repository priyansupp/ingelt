import 'package:flutter/material.dart';
import 'package:ingelt/models/message_model.dart';
import 'package:ingelt/models/user_model.dart';
import 'package:ingelt/screens/chat_page/group_info.dart';
import 'package:ingelt/shared/widgets/circular_pic.dart';

class GroupChat extends StatefulWidget {
  final UserModel user;


  const GroupChat({Key? key, required this.user}) : super(key: key);

  @override
  _GroupChatState createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat> {

  _buildMessage(MessageModel message, bool isMe) {
    final Container msg = Container(
      margin: isMe ? const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 110.0,)
          : const EdgeInsets.only(top: 4.0, bottom: 4.0,),

      padding: const EdgeInsets.fromLTRB(13.0, 10.0, 10.0, 10.0),
      width: MediaQuery.of(context).size.width * 0.65,

      decoration: BoxDecoration(
        color: isMe ? Theme.of(context).colorScheme.primary : const Color(0xFFD3D3D3),
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
                  color: isMe ? Colors.white : const Color(0xEE5A5A5A),
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
          radius: 23.0,
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
              decoration: const BoxDecoration(
                color: Color(0xFFD3D3D3),
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
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // appBar
            Container(
              color: const Color(0xFFD3D3D3),
              height: 75.0,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),

              child: Stack(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // const SizedBox(width: 15.0,),    // dont remove this
                  Transform.scale(scale: 0.9, child: const CircularPic()),

                  Positioned(
                    left: 70.0,
                    top: 15.0,
                    child: Text(
                      widget.user.displayName,
                      style: const TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // const SizedBox(width: 50.0,),
                  Positioned(
                    right: 40.0,
                    top: 15.0,
                    child: SizedBox(
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
                  ),
                  Positioned(
                    right: 0.0,
                    top: 5.0,
                    child: IconButton(
                      icon: const Icon(Icons.info_outline),
                      iconSize: 24.0,
                      color: Theme.of(context).colorScheme.primary,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GroupInfo()));
                      },
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



// import 'package:flutter/material.dart';
// import 'package:ingelt/models/group_model.dart';
// import 'package:ingelt/models/message_model.dart';
// import 'package:ingelt/models/user_model.dart';
//
// class GroupChat extends StatefulWidget {
//   final GroupModel group;
//
//   const GroupChat({Key? key, required this.group}) : super(key: key);
//
//   @override
//   _GroupChatState createState() => _GroupChatState();
// }
//
// class _GroupChatState extends State<GroupChat> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 75.0,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           onPressed: () => Navigator.of(context).pop(),
//           icon: const Icon(Icons.arrow_back),
//           color: Theme.of(context).secondaryHeaderColor,
//         ),
//         titleSpacing: 0,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             CircleAvatar(
//               backgroundImage: AssetImage(
//                 widget.group.imageUrl,
//               ),
//               radius: 20.0,
//             ),
//             const Spacer(),
//             Center(
//               child: Text(
//                 widget.group.name,
//                 style: TextStyle(
//                   fontSize: 24.0,
//                   fontWeight: FontWeight.bold,
//                   color: Theme.of(context).secondaryHeaderColor,
//                 ),
//               ),
//             ),
//             const Spacer(),
//             SizedBox(
//               height: 55.0,
//               width: 100.0,
//               child: ElevatedButton.icon(
//                 onPressed: () {},
//                 icon: const Icon(Icons.add_chart),
//                 label: const Text('Invite'),
//                 style: ElevatedButton.styleFrom(
//                   shape: const StadiumBorder(),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 5.0,),
//           ],
//         ),
//         elevation: 0.0,
//       ),
//       body: GestureDetector(
//         onTap: () => FocusScope.of(context).unfocus(),
//         child: Column(
//           children: <Widget>[
//             Expanded(
//               child: ListView.builder(
//                 reverse: true,
//                 // padding: const EdgeInsets.only(top: 5.0),
//                 itemCount: messages.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   final MessageModel message = messages[index];
//                   final bool isMe = message.sender.uid == widget.group.admin.uid;
//                   final double gapBySide = MediaQuery.of(context).size.width * 0.3;
//                   return _buildMessage(message, isMe, gapBySide);
//                 },
//               ),
//             ),
//             _buildMessageComposer(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   _buildMessage(MessageModel message, bool isMe, double gapBySide) {
//     final Container msg = Container(
//       margin: isMe ? EdgeInsets.only(top: 4.0, bottom: 4.0, left: gapBySide, right: 8.0,)
//           : EdgeInsets.only(top: 4.0, bottom: 4.0, left: 8.0, right: gapBySide),
//       padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
//       width: MediaQuery.of(context).size.width * 0.7,
//       decoration: BoxDecoration(
//         color: isMe ? Theme.of(context).colorScheme.primary : Theme.of(context).secondaryHeaderColor,
//         borderRadius: isMe
//             ? const BorderRadius.only(topLeft: Radius.circular(15.0), bottomLeft: Radius.circular(15.0),)
//             : const BorderRadius.only(topRight: Radius.circular(15.0), bottomRight: Radius.circular(15.0),),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             message.time,
//             style: TextStyle(
//               color: Theme.of(context).primaryColor,
//               fontSize: 12.0,
//             ),
//           ),
//           const SizedBox(height: 8.0),
//           Text(
//             message.text,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 16.0,
//             ),
//           ),
//         ],
//       ),
//     );
//     // if (isMe) {
//     //   return msg;
//     // }
//     return msg;
//     // return Row(
//     //   children: <Widget>[
//     //     msg,
//     //     IconButton(
//     //       icon: message.isLiked
//     //           ? const Icon(Icons.notification_important_sharp)
//     //           : const Icon(Icons.notification_important_outlined),
//     //       iconSize: 30.0,
//     //       color: message.isLiked
//     //           ? Theme.of(context).primaryColor
//     //           : Colors.blueGrey,
//     //       onPressed: () {},
//     //     )
//     //   ],
//     // );
//   }
//
//   _buildMessageComposer() {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 7.0),
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       height: 60.0,
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.elliptical(50.0, 50.0)),
//         color: Colors.white,
//       ),
//       child: Row(
//         children: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.add_photo_alternate_rounded),
//             iconSize: 30.0,
//             color: Theme.of(context).primaryColor,
//             onPressed: () {},
//           ),
//           Expanded(
//             child: TextField(
//               textCapitalization: TextCapitalization.sentences,
//               onChanged: (value) {},
//               decoration: const InputDecoration.collapsed(
//                 hintText: 'Send a message...',
//               ),
//             ),
//           ),
//           IconButton(
//             icon: const Icon(Icons.keyboard_voice_rounded),
//             iconSize: 30.0,
//             color: Theme.of(context).primaryColor,
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: const Icon(Icons.send),
//             iconSize: 30.0,
//             color: Theme.of(context).secondaryHeaderColor,
//             onPressed: () {},
//           ),
//         ],
//       ),
//     );
//   }
// }

