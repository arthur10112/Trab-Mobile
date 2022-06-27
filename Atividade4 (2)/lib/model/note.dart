class Note {
  String _nomeobra = "";
  String _description = "";
  String _url = "";
  String _path = "";

  Note() {
    _nomeobra = "";
    _description = "";
    _url = "";
    _path = "";
  }

  Note.withData({nomeobra = "", description = "", url = "", path = ""}) {
    _nomeobra = nomeobra;
    _description = description;
    _url = url;
    _path = path;
  }

  Note.fromMap(map) {
    _nomeobra = map["Nome da Obra"];
    _description = map["description"];
    _path = map["path"];
  }

  String get nomeobra => _nomeobra;
  String get description => _description;
  //String get tipo => _tipo;
  String get url => _url;
  String get path => _path;
  //
  set nomeobra(String newNomeobra) {
    if (newNomeobra.isNotEmpty) {
      _nomeobra = newNomeobra;
    }
  }

  set description(String newDescription) {
    if (newDescription.isNotEmpty) {
      _description = newDescription;
    }
  }

  /*set tipo(String newTipo) {
    if (newTipo.isNotEmpty) {
      _tipo = newTipo;
    }
  }*/
  set url(String newUrl) {
    _url = url;
  }

  set path(String newpath) {
    _path = newpath;
  }

  toMap() {
    var map = Map<String, dynamic>();
    map["Nome da Obra"] = _nomeobra;
    map["description"] = _description;
    //map["Tipo"] = _tipo;
    map["path"] = _path;
    return map;
  }
}
