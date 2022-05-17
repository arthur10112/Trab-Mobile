import 'package:blocexample/bloc/manage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/manage_event.dart';
import '../bloc/manage_state.dart';
import '../model/note.dart';

class Cadastro extends StatelessWidget {
  Cadastro({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey();
  final Note note = Note(); //nosso model

  @override
  Widget build(BuildContext context) {
    //recebe o manage bloc que passa as informacoes que passarao para as
    //caixas de texto
    return BlocBuilder<ManageBloc, ManageState>(builder: (context, state) {
      Note note;
      if (state is UpdateState) {
        note = state.previousNote;
      } else {
        note = Note();
      }
      return Form(
          key: formKey,
          child: Column(
            children: [
              nomeFormField(note),
              passwordFormField(note),
              emailFormField(note),
              idadeFormField(note),
              paisFormField(note),
              tipoFormField(note),
              nivelFormField(note),
              submitButton(note, context, state),
            ],
          ));
    });
  }

  Widget nomeFormField(Note note) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: note.nome,
        decoration: InputDecoration(labelText: "Nome", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        validator: (value) {
          if (value!.isEmpty) {
            return "Adicione algum Nome";
          }
          return null;
        },
        onSaved: (value) {
          note.nome = value!;
        },
      ),
    );
  }

  Widget passwordFormField(Note note) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: note.password,
        decoration: InputDecoration(labelText: "Senha", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        validator: (value) {
          if (value!.isEmpty) {
            return "Adicione alguma senha";
          }
          return null;
        },
        onSaved: (value) {
          note.password = value!;
        },
      ),
    );
  }

  Widget emailFormField(Note note) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: note.email,
        decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        validator: (value) {
          if (value!.isEmpty) {
            return "Adicione algum email";
          }
          return null;
        },
        onSaved: (value) {
          note.email = value!;
        },
      ),
    );
  }

  Widget idadeFormField(Note note) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: note.idade,
        decoration: InputDecoration(labelText: "Idade", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        validator: (value) {
          if (value!.isEmpty) {
            return "Digite sua idade";
          }
          return null;
        },
        onSaved: (value) {
          note.idade = value!;
        },
      ),
    );
  }

  Widget paisFormField(Note note) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: note.pais,
        decoration: InputDecoration(labelText: "Pais", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        validator: (value) {
          if (value!.isEmpty) {
            return "Adicione algum pais";
          }
          return null;
        },
        onSaved: (value) {
          note.pais = value!;
        },
      ),
    );
  }

  Widget tipoFormField(Note note) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: note.email,
        decoration: InputDecoration(labelText: "Tipo de sua arte desenho,fotografia ou escultura", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        validator: (value) {
          if (value!.isEmpty) {
            return "Adicione seu tipo de arte";
          }
          return null;
        },
        onSaved: (value) {
          note.tipo = value!;
        },
      ),
    );
  }

  Widget nivelFormField(Note note) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: note.nivel,
        decoration: InputDecoration(labelText: "Seu nivel: Iniciante,intermediario,profissional", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        validator: (value) {
          if (value!.isEmpty) {
            return "Adicione seu nivel (iniciante,medio,avancado";
          }
          return null;
        },
        onSaved: (value) {
          note.nivel = value!;
        },
      ),
    );
  }

  Widget submitButton(Note note, BuildContext context, ManageState state) {
    return ElevatedButton(
        child: (state is UpdateState ? const Text("Update Data") : const Text("Insert Data")),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            BlocProvider.of<ManageBloc>(context).add(SubmitEvent(note: note));
            formKey.currentState!.reset();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.purple, duration: const Duration(seconds: 5), content: const Text("Obrigado"), action: SnackBarAction(label: "Cadastrado com sucesso", onPressed: () {})));
          }
        });
  }
}
