import 'package:flutter_bloc/flutter_bloc.dart';

import '../provider/firebase_firestore.dart';
import 'manage_event.dart';
import 'manage_state.dart';

class ManageBloc extends Bloc<ManageEvent, ManageState> {
  ManageBloc() : super(InsertState()) {
    on<UpdateRequest>((event, emit) {
      emit(UpdateState(noteId: event.noteId, previousNote: event.previousNote));
    });

    on<UpdateCancel>((event, emit) {
      emit(InsertState());
    });

    on<SubmitEvent>((event, emit) {
      if (state is InsertState) {
        //ToDo: Inserir uma chamada de insert
        FirestoreServer.helper.insertNote(event.note);
      } else if (state is UpdateState) {
        //ToDo: Inserir uma chamada de Update
        FirestoreServer.helper.updateNote((state as UpdateState).noteId, event.note);
        emit(InsertState());
      }
    });
    on<DeleteEvent>((event, emit) {
      // ToDo: Inserir uma chamada de Delete

      FirestoreServer.helper.deleteNote(event.noteId);
    });
  }
}
