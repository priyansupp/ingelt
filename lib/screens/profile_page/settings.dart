import 'package:flutter/material.dart';
import 'package:ingelt/screens/profile_page/edit_profile.dart';
import 'package:ingelt/shared/widgets/circular_pic.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {

  List<String>settingNames = ["Business tools", "Account", "Chats", "Notifications", "Storage and Data", "Help", "Invite a contact"];
  List<String>subNames = ["Profile, Catalog, Messaging tools", "Privacy, Security, Change Number", "Theme, wallpaper, chat history", "Message and group", "Network usage, auto-download", "Help center, contact us, privacy policy", ""];
  List<IconData>icons = [
    Icons.task_rounded,
    Icons.key,
    Icons.chat,
    Icons.notification_add_sharp,
    Icons.pie_chart_rounded,
    Icons.help,
    Icons.contacts_rounded
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/home_title_bg.jpg',
                        ),
                        opacity: 0.15,
                        fit: BoxFit.cover
                    ),
                ),
                width: MediaQuery.of(context).size.width,
                height: 90.0,
                child: const Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.black54,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EditProfile()));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Row(
                    children: [
                      const CircularPic(),
                      const SizedBox(width: 13.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Priyanshu Jaiswal",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              letterSpacing: -0.3
                            ),
                          ),
                          Text(
                            "Consulting",
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.black54
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const Divider(
                color: Colors.black26,
                thickness: 1.0,
              ),

              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Options(settingName: settingNames[index], subName: subNames[index], ic: icons[index],);
                  },
                  itemCount: 7,

                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}

class Options extends StatefulWidget {
  final String settingName, subName;
  final IconData ic;
  const Options({Key? key, required this.settingName, required this.subName, required this.ic}) : super(key: key);

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                widget.ic,
                size: 37.0,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 17.0,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 7.0,),
                  Text(
                    widget.settingName,
                    style: const TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: -0.3
                    ),
                  ),
                  Text(
                    widget.subName,
                    style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.black54
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        widget.settingName == "Invite a contact" ? const SizedBox.shrink() : const Divider(
          color: Colors.black26,
          thickness: 1.0,
          indent: 70.0,
        )
      ],
    );
  }
}


