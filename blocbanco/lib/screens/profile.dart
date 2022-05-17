import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    /* return Container(
        //margin: EdgeInsets.only(top: 50, left: 16, right: 16),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("ulissesdias",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.black,
                    )))
          ])
        ])
        );*/

    return Container(
        child: Column(children: [
      Text("ulissesdias",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          )),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10, right: 5, bottom: 10),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("assets/images/ulisses.jpeg"),
            ),
            //const Text("Arthur de Paula", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 2, color: Colors.purpleAccent)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Text("4\nPosts"),
                /*
              FollowersWidget(
                info: "970\nFollowers",
              ),
              FollowersWidget(
                info: "450\nFollowing",
              ),*/
              ],
            ),
          )
        ],
      )
      //Row(    )
    ]));
  }
}
