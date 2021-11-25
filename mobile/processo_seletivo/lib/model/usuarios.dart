class Usuario {
  String _nome;
  String _email;
  String _senha;
  DateTime _updatedAt;
  DateTime _createdAt;
  int _id;
  String _token;

  Usuario(
      {String nome,
        String email,
        String senha,
        DateTime updatedAt,
        DateTime createdAt,
        int id,
        String token}) {
    this._nome = nome;
    this._email = email;
    this._updatedAt = updatedAt;
    this._createdAt = createdAt;
    this._id = id;
    this._token = token;
    this._senha = senha;
  }

  String get nome => this._nome;
  set nome(String nome) => _nome = nome;
  String get email => this._email;
  set email(String email) => _email = email;
  DateTime get updatedAt => this._updatedAt;
  set updatedAt(DateTime updatedAt) => _updatedAt = updatedAt;
  DateTime get createdAt => this._createdAt;
  set createdAt(DateTime createdAt) => _createdAt = createdAt;
  int get id => this._id;
  set id(int id) => _id = id;
  String get token => this._token;
  set token(String token) => _token = token;
  String get senha => _senha;
  set senha(String value) => this. _senha = value;

  Usuario.fromJson(Map<String, dynamic> json) {
    _nome = json['nome'];
    _email = json['email'];
    if(json.containsKey('id')) _id = json['id'];
    _token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._nome != null) data['nome'] = this._nome;
    data['email'] = this._email;
    data['senha'] = this._senha;
    return data;
  }
}