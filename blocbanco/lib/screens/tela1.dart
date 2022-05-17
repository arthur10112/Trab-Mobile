import 'package:flutter/material.dart';

class Tela1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return presentationScreen();
  }
}

Widget presentationScreen() {
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(55), border: Border.all(color: Colors.black, width: 6)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(49),
              child: Image.asset(
                'assets/images/arthur.gif',
                width: 200,
              )),
        ),
        const Text("Arthur de Paula", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 2, color: Colors.purpleAccent)),
        const Text(
          "Eu sou aluno de Sistema de Informacaoda Unicamp,gosto da aula do prof Ulisses e gosto de bolo",
          style: TextStyle(fontSize: 20, color: Colors.black, letterSpacing: 2, fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
