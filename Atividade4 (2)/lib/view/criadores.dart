import 'package:flutter/material.dart';

class Criadores extends StatelessWidget {
  Criadores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Material(
          child: ListTile(
            title: Text('Arthur e Renan'),
          ),
        ),
      ],
    );
  }
}
