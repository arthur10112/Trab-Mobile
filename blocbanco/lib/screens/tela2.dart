import 'package:flutter/material.dart';

class Tela2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return /*Center(
      child: Container(
        color: Colors.red,
      ),
    );*/
        presentationScreen();
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
                'assets/images/renan.gif',
                width: 200,
              )),
        ),
        const Text("Renan Ferretti", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, letterSpacing: 2, color: Colors.blueAccent)),
        const Text(
          "Eu sou aluno de Sistema de Informacao da Unicamp,sou monitor de Engenharia de software 2 e gosto de machine learning e futebol.Tambem fiz calculo 2 por opcao,alguns me chamam de louco",
          style: TextStyle(fontSize: 20, color: Colors.black, letterSpacing: 2, fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
