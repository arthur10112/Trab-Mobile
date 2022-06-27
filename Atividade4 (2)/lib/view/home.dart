import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            atorbar(),
            imagem(),
          ],
        ),
      ),
    );
  }
}

Widget atorbar() {
  return Container(
    child: Row(
      children: [
        Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.black, width: 4)),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/images/ulisses.jpeg"),
            )),
        //const Text("UlissesDias123", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 2, color: Colors.blueAccent)),
      ],
    ),
  );
}

Widget imagem() {
  return SingleChildScrollView(
      child: Column(children: [
    Container(
      decoration: BoxDecoration(
          //borderRadius: BorderRadius.circular(55),
          //border: Border.all(color: Colors.black, width: 6),
          ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(49),
        child: Image.asset(
          'assets/images/ceu_estrela.jpeg',
          width: 400,
          height: 400,
        ),
      ),
    ),
    Text(
      "ulissesdias123                                           ",
      style: TextStyle(fontSize: 14, color: Colors.grey.shade600, fontWeight: FontWeight.bold),
    )
  ]));
}
