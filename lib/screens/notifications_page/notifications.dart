import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ingelt/shared/constants.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 7.0),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/home_title_bg.jpg',
                  ),
                  opacity: 0.20,
                  fit: BoxFit.cover
              )
          ),
          width: MediaQuery.of(context).size.width,
          height: 100.0,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  width: 100.0,
                  height: 60.0,
                  image: const AssetImage(
                      'assets/ingelt-logo.png'
                  ),
                  fit: BoxFit.fill,
                  color: AppThemeData.blackishTextColor
                ),
                const SizedBox(height: 10.0,),
                Text(
                  ' Notifications',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      height: -0.01,
                    color: AppThemeData.blackishTextColor,
                    letterSpacing: 1
                  ),
                ),
              ],
            ),
          ),
        ),

        Expanded(
          child: Container(
            color: Colors.white,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: const [
                    Notif(),
                    Divider()
                  ],
                );
              },

              itemCount: 10,
            ),
          ),
        ),



      ],
    );
  }
}

class Notif extends StatelessWidget {
  const Notif({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15.0, 7.5, 15.0, 7.5),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            // mainAxisSize: MainAxisSize.max,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/analytics.jpg',
                ),
                radius: 25,
              ),

              const SizedBox(width: 10.0,),

              Text(
                'Riya',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: AppThemeData.primaryAppColor
                ),
              ),

              const SizedBox(width: 4.0,),

              Text(
                'liked your post',
                maxLines: 2,
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: AppThemeData.blackishTextColor,
                    overflow: TextOverflow.ellipsis
                ),
              ),

            ],
          ),

          Text(
            '08:12',
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                color: AppThemeData.blackishTextColor
            ),
          ),

        ],
      ),

    );
  }
}

