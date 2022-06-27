import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey();
    String nome = "";
    String email = "";
    String password = "";
    String idade = "";
    String pais = "";
    String nivel = "";

    return Form(
      key: formkey,
      child: Column(
        children: [
          TextFormField(
            validator: (String? inValue) {
              if (inValue!.isEmpty) {
                return "Insira algo como nome/username";
              }
              return null;
            },
            onSaved: (String? inValue) {
              nome = inValue!;
            },
            decoration: const InputDecoration(
              labelText: "Nome ou Username",
            ),
          ),
          TextFormField(
            validator: (String? inValue) {
              if (inValue!.isEmpty) {
                return "Insira seu email";
              }
              return null;
            },
            onSaved: (String? inValue) {
              email = inValue!;
            },
            decoration: const InputDecoration(
              hintText: "user@domain.br",
              labelText: "Email",
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
              labelText: "Senha",
            ),
          ),
          TextFormField(
            validator: (String? inValue) {
              if (inValue!.isEmpty) {
                return "Insira algo como idade";
              }
              return null;
            },
            onSaved: (String? inValue) {
              idade = inValue!;
            },
            decoration: const InputDecoration(
              labelText: "Idade",
            ),
          ),
          TextFormField(
            validator: (String? inValue) {
              if (inValue!.isEmpty) {
                return "Insira algo como pais";
              }
              return null;
            },
            onSaved: (String? inValue) {
              pais = inValue!;
            },
            decoration: const InputDecoration(
              labelText: "Pais",
            ),
          ),
          TextFormField(
            validator: (String? inValue) {
              if (inValue!.isEmpty) {
                return "Insira seu nivel";
              }
              return null;
            },
            onSaved: (String? inValue) {
              nivel = inValue!;
            },
            decoration: const InputDecoration(
              labelText: "Seu nivel (iniciante,medio,avancado)",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
                // Lançando evento
                BlocProvider.of<AuthBloc>(context).add(RegisterUser(
                  nome: nome,
                  email: email,
                  password: password,
                  idade: idade,
                  pais: pais,
                  nivel: nivel,
                ));
              }
            },
            child: const Text("Registro"),
          ),
        ],
      ),
    );
  }
}
