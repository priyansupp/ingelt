import 'package:flutter/material.dart';

class Featured extends StatefulWidget {
  final String? text;
  final String? photoURL;
  const Featured({Key? key, required this.text, required this.photoURL}) : super(key: key);

  @override
  State<Featured> createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 20.0,),
        Material(
          elevation: 10.0,
          shadowColor: Colors.grey,
          clipBehavior: Clip.antiAlias,     // clips all of its children
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),    // gives border radius to the material platoform on which the container is placed.
          child: Container(
            height: 280.0,
            width: 220.0,
            color: Colors.white,
            // decoration: const BoxDecoration(
            //   borderRadius: BorderRadius.all(Radius.circular(20.0)),    // gives border radius to the container
            // ),
            // clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                widget.photoURL != null ? Image(
                  image: NetworkImage(
                    '${widget.photoURL}'
                  ),
                  height: 220.0,
                  fit: BoxFit.cover,
                ) : const Image(
                  image: AssetImage(
                    'assets/analytics.jpg'
                  ),
                  height: 220.0,
                  fit: BoxFit.cover,
                ) ,
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
                    child: widget.text != null ? Text(
                      widget.text!,
                      maxLines: 2,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                      ),
                    ) : const SizedBox.shrink(),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
