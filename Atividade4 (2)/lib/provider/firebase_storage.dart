import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class StorageServer {
  // Atributo que irá afunilar todas as consultas
  static StorageServer helper = StorageServer._createInstance();
  // Construtor privado
  StorageServer._createInstance();

  // Ponto de acesso com o servidor
  final Reference noteImage = FirebaseStorage.instance.ref("images");

  UploadTask? sendImage(String uid, String noteId, String path) {
    try {
      final ref = noteImage.child(uid).child(noteId + ".jpg");
      return ref.putFile(File(path));
    } on FirebaseException {
      return null;
    }
  }

  deleteImage(String uid, String noteId) {
    final ref = noteImage.child(uid).child(noteId + ".jpg");
    ref.delete();
  }
}
