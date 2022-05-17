import 'package:blocexample/bloc/manage_event.dart';
import 'package:blocexample/provider/rest_provider_no_sync.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        RestServer.helper.insertNote(event.note);
      } else if (state is UpdateState) {
        //ToDo: Inserir uma chamada de Update
        RestServer.helper.updateNote((state as UpdateState).noteId, event.note);
      }
    });
  }
}
