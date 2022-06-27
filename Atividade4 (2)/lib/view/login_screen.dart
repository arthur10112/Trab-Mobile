import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey();
    String email = "";
    String password = "";
    return Form(
      key: formkey,
      child: Column(
        children: [
          TextFormField(
            validator: (String? inValue) {
              if (inValue!.isEmpty) {
                return "Insira algo no email";
              }
              return null;
            },
            onSaved: (String? inValue) {
              email = inValue!;
            },
            decoration: const InputDecoration(
              hintText: "user@domain.br",
              labelText: "(E-mail Address)",
            ),
          ),
          TextFormField(
              validator: (String? inValue) {
                if (inValue!.length < 4) {
                  return "Tem que ter ao menos 4 caracters";
                }
                return null;
              },
              onSaved: (String? inValue) {
                password = inValue!;
              },
              decoration: const InputDecoration(
                labelText: "Insira sua senha",
              )),
          ElevatedButton(
            onPressed: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
                // Lançando evento
                BlocProvider.of<AuthBloc>(context).add(LoginUser(email: email, password: password));
              }
            },
            child: const Text("Login"),
          ),
        ],
      ),
    );
  }
}
