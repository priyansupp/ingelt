import 'package:flutter/material.dart';

import '../../models/user_model.dart';
import 'chat.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {

  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/home_title_bg.jpg',
                      ),
                      opacity: 0.15,
                      fit: BoxFit.cover
                  )
              ),
              width: MediaQuery.of(context).size.width,
              height: 80.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Image(
                    width: 100.0,
                    height: 60.0,
                    image: AssetImage(
                        'assets/ingelt-logo.png'
                    ),
                    fit: BoxFit.fill,
                  ),

                  Expanded(
                    child: Material(
                      elevation: 2.0,
                      shadowColor: Colors.grey,
                      shape: const StadiumBorder(),
                      // borderRadius: const BorderRadius.all(Radius.circular(40.0)),
                      child: SizedBox(
                        height: 33.0,
                        child: TextField(
                          controller: _searchController,
                          textInputAction: TextInputAction.search,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 40.0, right: 10.0),
                                child: Icon(
                                  Icons.search,
                                  color: Theme.of(context).secondaryHeaderColor,
                                  size: 20.0,
                                ),
                              ),
                              hintText: 'Seach Chat',
                              hintStyle: const TextStyle(
                                fontSize: 16.0,
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0.0,
                                    style: BorderStyle.none
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(7.0)),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0.0,
                                    style: BorderStyle.none
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              )

                          ),
                        ),
                      ),
                    ),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert_rounded),
                    color: Colors.black,
                    iconSize: 30.0,
                  )
                ],
              ),
            ),

            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/home_title_bg.jpg',
                      ),
                      opacity: 0.15,
                      fit: BoxFit.cover
                  )
              ),
              child: TabBar(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                // labelColor: Theme.of(context).colorScheme.primary,
                labelStyle: const TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey
                ),
                indicatorColor: Theme.of(context).colorScheme.primary,
                indicatorWeight: 2.5,
                controller: _tabController,
                // onTap: () {},
                tabs: const <Widget>[
                  Tab(
                    text: 'Chat',
                  ),
                  Tab(
                    text: 'Message',
                  ),
                ],
              ),
            ),


            SizedBox(
              width: double.maxFinite,
              height: double.maxFinite,
              // height: 1000.0,
              child: TabBarView(
                controller: _tabController,
                children: const [
                  FetchChats(),
                  FetchMessages(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FetchChats extends StatefulWidget {
  const FetchChats({Key? key}) : super(key: key);

  @override
  State<FetchChats> createState() => _FetchChatsState();
}

class _FetchChatsState extends State<FetchChats> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
      return Column(
        children: const [
          Conversation(name: 'Riya', lastMessage: 'okk i will call you'),
        ],
      );
    },
    itemCount: 12,
    );
  }
}

class FetchMessages extends StatefulWidget {
  const FetchMessages({Key? key}) : super(key: key);

  @override
  State<FetchMessages> createState() => _FetchMessagesState();
}
final UserModel userrrrr = UserModel(uid: '0', displayName: 'Priyanshu', photoURL: 'assets/person.jpg', phone: '9643763504', emailAddress: 'priyanshu@iitg.ac.in');

class _FetchMessagesState extends State<FetchMessages> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return const Conversation(name: 'Not riya', lastMessage: 'okk i will not call you');
      },
      itemCount: 6,
    );;
  }
}

class Conversation extends StatefulWidget {
  final String name, lastMessage;
  const Conversation({Key? key, required this.name, required this.lastMessage}) : super(key: key);

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatScreen(user: userrrrr),));
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(15.0, 7.5, 15.0, 7.5),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/analytics.jpg'
                      ),
                      radius: 27.0,
                    ),
                    const SizedBox(width: 17.0,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 7.0,),
                        Text(
                          widget.name,
                          style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              letterSpacing: -0.3
                          ),
                        ),
                        const SizedBox(height: 5.0,),
                        Text(
                          widget.lastMessage,
                          style: const TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                Column(
                  children: [
                    const Text(
                      '15 mins',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 1.0),
                      child: const Text(
                        '12',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0
                        ),
                      ),
                    )
                  ],
                ),

              ],
            ),

          ),

          const Divider(
            color: Colors.black26,
            thickness: 1.0,
            indent: 80.0,
          )
        ],
      ),
    );
  }
}


