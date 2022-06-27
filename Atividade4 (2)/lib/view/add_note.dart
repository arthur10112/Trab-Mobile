import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';

import '../bloc/manage_bloc.dart';
import '../bloc/manage_event.dart';
import '../bloc/manage_state.dart';
import '../model/note.dart';

class AddNote extends StatelessWidget {
  AddNote({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey();
  final Note note = Note();

  @override
  Widget build(BuildContext context) {
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
              nomeobraFormField(note),
              descriptionFormField(note),
              //tipoFormField(note),
              //imageButton(note),
              imagePickerFormField(note),
              submitButton(note, context, state),
              cancelButton(note, context, state),
            ],
          ));
    });
  }

  Widget nomeobraFormField(Note note) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: note.nomeobra,
        decoration: InputDecoration(labelText: "Nome da Obra", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        validator: (value) {
          if (value!.isEmpty) {
            return "Adicione o nome da obra";
          }
          return null;
        },
        onSaved: (value) {
          note.nomeobra = value!;
        },
      ),
    );
  }

  Widget descriptionFormField(Note note) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: note.description,
        decoration: InputDecoration(labelText: "Descricao da Obra", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        validator: (value) {
          if (value!.isEmpty) {
            return "Adicione uma descrição para a obra";
          }
          return null;
        },
        onSaved: (value) {
          note.description = value!;
        },
      ),
    );
  }

  /* Widget imageButton(Note note) {
    return ElevatedButton(
        child: Text("Load Image"),
        onPressed: () async {
          FilePickerResult? result = await FilePicker.platform.pickFiles();

          if (result != null) {
            note.path = result.files.single.path ?? "";
          } else {
            // User canceled the picker
          }
        });
  }*/

  Widget imagePickerFormField(Note note) {
    return Column(children: [
      IconButton(
        icon: Icon(Icons.folder),
        onPressed: () => _imgFromGallery(note),
      ),
    ]);
  }

  _imgFromGallery(Note note) async {
    FilePickerResult? pickedFile = await FilePicker.platform.pickFiles();

    if (pickedFile != null) {
      note.path = pickedFile.files.single.path ?? "";
    }
  }

  Widget submitButton(Note note, BuildContext context, ManageState state) {
    return ElevatedButton(
        child: (state is UpdateState ? const Text("Update Data") : const Text("Insert Data")),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            BlocProvider.of<ManageBloc>(context).add(SubmitEvent(note: note));
            formKey.currentState!.reset();
          }
        });
  }

  Widget cancelButton(Note note, BuildContext context, ManageState state) {
    return (state is UpdateState
        ? ElevatedButton(
            onPressed: () {
              BlocProvider.of<ManageBloc>(context).add(UpdateCancel());
            },
            child: const Text("Cancel Update"))
        : Container());
  }
}

/*
  Widget tipoFormField(Note note) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: note.tipo,
        decoration: InputDecoration(labelText: "Tipo da obra(desenho,fotografia ou escultura)", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        validator: (value) {
          if (value!.isEmpty) {
            return "Adicione um tipo para a obra(desenho,fotografia ou escultura)";
          }
          return null;
        },
        onSaved: (value) {
          note.tipo = value!;
        },
      ),
    );
  }


  Widget imageButton(Note note) {
    return ElevatedButton(
        child: Text("Load Image"),
        onPressed: () async {
          FilePickerResult? result = await FilePicker.platform.pickFiles();

          if (result != null) {
            note.path = result.files.single.path ?? "";
          } else {
            // User canceled the picker
          }
        });
  }
  */
