import 'package:flutter/material.dart';

import '../model/login.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LoginData loginData = LoginData(email: "", password: "");

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailFormField(),
            passwordFormField(),
            const Divider(),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (String? inValue) {
        if (inValue != null) {
          if (inValue.isEmpty) {
            return "Insira seu email";
          }
        }
        return null;
      },
      onSaved: (String? inValue) {
        loginData.email = inValue ?? "";
      },
      decoration: const InputDecoration(
        hintText: "user@domain.br",
        labelText: "(E-mail Address)",
      ),
    );
  }

  Widget passwordFormField() {
    return TextFormField(
      obscureText: true,
      validator: (String? inValue) {
        if (inValue != null) {
          if (inValue.length < 10) {
            return "Mínimo de 10 letras";
          }
        }
        return null;
      },
      onSaved: (String? inValue) {
        loginData.password = inValue ?? "";
      },
      decoration: const InputDecoration(
        labelText: "Insira sua senha",
      ),
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      child: const Text("Log In!"),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          loginData.doSomething();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.blue, duration: const Duration(seconds: 5), content: const Text("Obrigado"), action: SnackBarAction(label: "Voce esta logado!", onPressed: () {})));
        }
      },
    );
  }
}
