import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/notes.dart';
import '../bloc/monitor_bloc.dart';
import '../bloc/monitor_state.dart';

class ListNote extends StatelessWidget {
  ListNote({Key? key}) : super(key: key);

/*
  final List colors = [
    Colors.orange,
    Colors.red,
    Colors.yellow
  ];
  final List icons = [
    Icons.ac_unit_outlined,
    Icons.access_alarm_rounded
  ];
*/
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonitorBloc, MonitorState>(
      builder: (context, state) => getNoteListView(state.noteCollection),
    );

    /*return getNoteListView(NoteCollection()
      ..updateOrInsertNoteOfId(
          "1",
          Note.withData(
            title: "a",
            description: "a",
          )));*/
  }

  ListView getNoteListView(NoteCollection noteCollection) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: noteCollection.length(),
        itemBuilder: (context, position) {
          return Container(
            height: 300,
            child: Image.network(noteCollection.getNodeAtIndex(position).path, height: 300, width: 300),
            //child: Text(noteCollection.getNodeAtIndex(position).nomeobra, height :100),
          );
          return Container(
            height: 100,
            child: Text(noteCollection.getNodeAtIndex(position).nomeobra),

//Jeito que eu fiz mas daerro no child 2
/*       padding: const EdgeInsets.all(8),
        itemCount: noteCollection.length(),
        itemBuilder: (context, position) {
        children: [
          Container(
              height: 300,
              child: Image.network(noteCollection.getNodeAtIndex(position).path, height: 300, width: 300),
              //child: Text(noteCollection.getNodeAtIndex(position).nomeobra ),
          ),
          Container(
            height:100,
            child: Text(noteCollection.getNodeAtIndex(position).nomeobra ),
          ),
        ];  */

            //Jeito do Ulisses=----------------//
            /* height: 300,
                    child: Image.network(noteCollection.getNodeAtIndex(position).path, height: 300, width: 300),
                    onTap: () {
                BlocProvider.of<ManageBloc>(context).add(UpdateRequest(noteId: noteCollection.getIdAtIndex(position), previousNote: noteCollection.getNodeAtIndex(position)));
                  },*/
            //leading: Icon(icons[position % icons.length]),
            //leading: Image.network(noteCollection.getNodeAtIndex(position).path),
            //leading: Text(noteCollection.getNodeAtIndex(position).path),
            /*trailing: GestureDetector(
                    onTap: () {
                      BlocProvider.of<ManageBloc>(context).add(DeleteEvent(noteId: noteCollection.getIdAtIndex(position)));

                    // BlocProvider.of<MonitorBloc>(context).add(AskNewList());
                  },
                  child: const Icon(Icons.delete)),
                    //title: Text(noteCollection.getNodeAtIndex(position).path),
                    //subtitle: Text(noteCollection.getNodeAtIndex(position).path),
                  ),*/
          );
        });
  }
}
