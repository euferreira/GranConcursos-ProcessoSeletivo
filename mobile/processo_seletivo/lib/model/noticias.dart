import 'package:processo_seletivo/model/paginacao.dart';

class Noticias {
  Noticias({
    int id,
    String titulo,
    String descricao,
    String materia,
  }) {
    _id = id;
    _titulo = titulo;
    _descricao = descricao;
    _materia = materia;
  }

  Noticias.fromJson(Map<String, Object> json) {
    _id = json['id'];
    _titulo = json['titulo'];
    _descricao = json['descricao'];
    _materia = json['materia'];
  }

  int _id;
  String _titulo;
  String _descricao;
  String _materia;
  Paginacao _paginacao;


  Paginacao get paginacao => _paginacao;

  int get id => _id;

  String get titulo => _titulo;

  String get descricao => _descricao;

  String get materia => _materia;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['titulo'] = _titulo;
    map['descricao'] = _descricao;
    map['materia'] = _materia;
    return map;
  }
}
