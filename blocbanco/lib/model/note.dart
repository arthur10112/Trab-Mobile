class Note {
  String _nome = "";
  String _password = "";
  String _idade = "";
  String _pais = "";
  String _email = "";
  String _tipo = "";
  String _nivel = "";

  Note() {
    _nome = "";
    _password = "";
    _idade = "";
    _pais = "";
    _email = "";
    _tipo = "";
    _nivel = "";
  }

  Note.withData({nome = "", password = "", idade = "", pais = "", email = "", tipo = "", nivel = ""}) {
    _nome = nome;
    _password = password;
    _idade = idade;
    _pais = pais;
    _email = email;
    _tipo = tipo;
    _nivel = nivel;
  }

  Note.fromMap(map) {
    _nome = map["nome"];
    _password = map["password"];
    _idade = map["idade"];
    _pais = map["pais"];
    _email = map["email"];
    _tipo = map["tipo"];
    _nivel = map["nivel"];
  }

  String get nome => _nome;
  String get password => _password;
  String get idade => _idade;
  String get pais => _pais;
  String get email => _email;
  String get tipo => _tipo;
  String get nivel => _nivel;

  set nome(String newNome) {
    if (newNome.isNotEmpty) {
      _nome = newNome;
    }
  }

  set password(String newPassword) {
    if (newPassword.isNotEmpty) {
      _password = newPassword;
    }
  }

  set idade(String newIdade) {
    if (newIdade.isNotEmpty) {
      _idade = newIdade;
    }
  }

  set pais(String newPais) {
    if (newPais.isNotEmpty) {
      _pais = newPais;
    }
  }

  set email(String newEmail) {
    if (newEmail.isNotEmpty) {
      _email = newEmail;
    }
  }

  set tipo(String newTipo) {
    if (newTipo.isNotEmpty) {
      _tipo = newTipo;
    }
  }

  set nivel(String newNivel) {
    if (newNivel.isNotEmpty) {
      _nivel = newNivel;
    }
  }

  toMap() {
    //transforma note em map pois metodos como Post querem map
    var map = Map<String, dynamic>();
    map["nome"] = _nome;
    map["password"] = _password;
    map["idade"] = _idade;
    map["pais"] = _pais;
    map["email"] = _email;
    map["tipo"] = _tipo;
    map["nivel"] = _nivel;
    return map;
  }
}
