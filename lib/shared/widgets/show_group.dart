import 'package:flutter/material.dart';
import 'package:ingelt/shared/widgets/circular_pic.dart';
import 'package:ingelt/shared/widgets/rating.dart';

class ShowGroup extends StatefulWidget {
  const ShowGroup({Key? key}) : super(key: key);

  @override
  State<ShowGroup> createState() => _ShowGroupState();
}

class _ShowGroupState extends State<ShowGroup> {

  TextStyle customStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0))
      ),
      child: Column(
        children: [
          // the white container
          Container(
            height: 100.0,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          ),

          // the green container
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  opacity: 0.1,
                  image: AssetImage(
                    'assets/home_title_bg.jpg',
                  ),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.lighten)
              ),
            ),
            padding: const EdgeInsets.fromLTRB(30, 15, 30, 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      '| Blinkit',
                      style: TextStyle(
                        fontSize: 23.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                      ),
                    ),

                    Text(
                      '10th Aug 2022',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.white
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10.0,),

                const Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Text(
                    'Capitalisaition an accounting method in which a cost and which is nade forward through propagation method and delays',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.0,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.white,
                      letterSpacing: -0.1
                    ),
                    maxLines: 2,
                  ),
                ),

                Divider(
                  thickness: 0.7,
                  color: Colors.white,
                  endIndent: MediaQuery.of(context).size.width*0.6,
                ),

                const SizedBox(
                  child: Text(
                    'Capitalisaition an accounting method in which a cost and which is nade forward through propagation method and delays. But what creates delays is the fact that wr can type withouht having a look at the keyboard. Our humna brains havre been trained to adapt to practive and now it doesnt ecen require constant conscious efforts to tyope and find keys netiher to know where to hit.',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.white,
                        letterSpacing: -0.1
                    ),
                    maxLines: 5,
                  ),
                ),

                const SizedBox(height: 10.0,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: <Widget>[
                        Stack(
                          fit: StackFit.passthrough,
                          children: const [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/person.jpg'
                              ),
                              radius: 18.0,
                            ),
                            SizedBox(width: 70.0,),
                            Positioned(
                              left: 15.0,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/person.jpg'
                                ),
                                radius: 18.0,
                              ),
                            ),
                            Positioned(
                              left: 30.0,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/person.jpg'
                                ),
                                radius: 18.0,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Joined',
                              style: customStyle,
                            ),
                            Text(
                              '12 seats remaining',
                              style: customStyle.copyWith(fontWeight: FontWeight.w400, fontSize: 12.0),
                            ),
                          ],
                        )
                      ],
                    ),

                    SizedBox(
                      height: 40.0,
                      width: 130.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: Theme.of(context).colorScheme.secondary,
                        ),
                        onPressed: () {

                        },
                        child: const Text(
                          'Request',
                          style: TextStyle(
                            fontSize: 23.0,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ),
                  ],
                ),


              ],
            )
          ),

          const SizedBox(height: 1.5,),   // works as horizontal divider between two containers

          // const Divider(
          //   color: Colors.white,
          //   thickness: 0.1,
          // ),

          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  opacity: 0.1,
                  image: const AssetImage(
                    'assets/home_title_bg.jpg',
                  ),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.lighten)
              ),
            ),
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 15),
            child: Stack(
              children: [
                Stack(
                  children: [
                    const CircularPic(),
                    Positioned(
                      bottom: -2.0,
                      left: 7.0,
                      child: Container(
                        height: 15.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.elliptical(50.0, 50.0)),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: const Center(
                          child: Text(
                            'Admin',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),

                Positioned(
                  left: 70.0,
                  bottom: 0.0,
                  top: 0.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Priyanshu Jaiswal',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          fontWeight: FontWeight.w600
                        ),
                      ),

                      Text(
                        'Founder | WebD Team',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                ),

                Positioned(right: 0.0, bottom: 0.0, top: 6.0, child: const Rating(percentage: 45)),
              ],
            ),
          )
        ],
      )
    );
  }
}
