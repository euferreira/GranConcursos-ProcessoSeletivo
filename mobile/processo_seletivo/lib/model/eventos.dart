class Eventos {
  int _id;
  String _titulo;
  String _descricao;
  String _conteudo;
  String _produtor;

  Eventos({int id, String titulo, String descricao, String conteudo, String produtor}) {
    this._id = id;
    this._titulo = titulo;
    this._descricao = descricao;
    this._conteudo = conteudo;
    this._produtor = produtor;
  }

  Eventos.fromJson(Map<String, Object> json) {
    _id = json['id'];
    _titulo = json['titulo'];
    _descricao = json['descricao'];
    _conteudo = json['conteudo'];
    _produtor = json['produtor'];
  }

  String get produtor => _produtor;

  set produtor(String value) {
    _produtor = value;
  }

  String get conteudo => _conteudo;

  set conteudo(String value) {
    _conteudo = value;
  }

  String get descricao => _descricao;

  set descricao(String value) {
    _descricao = value;
  }

  String get titulo => _titulo;

  set titulo(String value) {
    _titulo = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}