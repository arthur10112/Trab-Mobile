import 'package:br/provider/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../model/note.dart';
import '../model/notes.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServer {
  // Atributo que irá afunilar todas as consultas
  static FirestoreServer helper = FirestoreServer._createInstance();
  // Construtor privado
  FirestoreServer._createInstance();

  // uid do usuário logado
  String? uid;

  // Ponto de acesso com o servidor                                               aqui era notes
  final CollectionReference noteCollection = FirebaseFirestore.instance.collection("Obras");
  //uid virou fotos                           my_notes virou Feed
  Future<Note> getNote(noteId) async {
    DocumentSnapshot doc = await noteCollection.doc("fotos").collection("feed").doc(noteId).get();
    Note note = Note.fromMap(doc.data());
    return note;
  }

  Future<int> insertNote(Note note) async {
    DocumentReference ref = await noteCollection.doc("fotos").collection("feed").add({
      "Nome da Obra": note.nomeobra,
      "description": note.description
    });
    if (note.path != "") {
      UploadTask? task = StorageServer.helper.sendImage(uid!, ref.id, note.path);
      if (task != null) {
        final snapshot = await task.whenComplete(() {});
        final urlDownload = await snapshot.ref.getDownloadURL();
        await noteCollection.doc("fotos").collection("feed").doc(ref.id).update({
          "Nome da Obra": note.nomeobra,
          "description": note.description,
          "path": urlDownload
        });
      }
    }

    return 42;
  }

  Future<int> updateNote(noteId, Note note) async {
    if (note.path != "") {
      UploadTask? task = StorageServer.helper.sendImage(uid!, noteId, note.path);
      if (task != null) {
        final snapshot = await task.whenComplete(() {});
        final urlDownload = await snapshot.ref.getDownloadURL();
        note.path = urlDownload;
      }
    }

    await noteCollection.doc("fotos").collection("feed").doc(noteId).update({
      "Nome da Obra": note.nomeobra,
      "description": note.description,
      "path": note.path
    });
    return 42;
  }

  Future<int> deleteNote(noteId) async {
    StorageServer.helper.deleteImage(uid!, noteId);
    await noteCollection.doc("fotos").collection("feed").doc(noteId).delete();
    return 42;
  }

  NoteCollection _noteListFromSnapshot(QuerySnapshot snapshot) {
    NoteCollection noteCollection = NoteCollection();
    for (var doc in snapshot.docs) {
      Note note = Note.fromMap(doc.data());
      noteCollection.insertNoteOfId(doc.id, note);
    }
    return noteCollection;
  }

  Future<NoteCollection> getNoteList() async {
    QuerySnapshot snapshot = await noteCollection.doc("fotos").collection("feed").get();

    return _noteListFromSnapshot(snapshot);
  }

  Stream get stream {
    return noteCollection.doc("fotos").collection("feed").snapshots().map(_noteListFromSnapshot);
  }
}
