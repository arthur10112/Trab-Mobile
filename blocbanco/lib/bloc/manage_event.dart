import '../model/note.dart';

abstract class ManageEvent {}

class SubmitEvent extends ManageEvent {
  Note note;
  SubmitEvent({required this.note});
}

class UpdateRequest extends ManageEvent {
  String noteId;
  Note previousNote;
  UpdateRequest({required this.noteId, required this.previousNote});
}

class UpdateCancel extends ManageEvent {}
