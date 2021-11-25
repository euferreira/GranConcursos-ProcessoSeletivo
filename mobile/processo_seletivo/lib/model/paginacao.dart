class Paginacao {
  int _paginaAtual;
  String _nextPageUrl;
  int _resultadosPorPagina;
  int _totalCount;

  Paginacao(
      {int paginaAtual,
      String nextPageUrl,
      int resultadosPorPagina,
      int totalCount}) {
    this._paginaAtual = paginaAtual;
    this._nextPageUrl = nextPageUrl;
    this._resultadosPorPagina = resultadosPorPagina;
    this._totalCount = totalCount;
  }

  int get totalCount => this._totalCount;

  int get resultadosPorPagina => this._resultadosPorPagina;

  String get nextPageUrl => this._nextPageUrl;

  int get paginaAtual => this._paginaAtual;

  set totalCount(int value) => _totalCount = value;

  set resultadosPorPagina(int value) => _resultadosPorPagina = value;

  set nextPageUrl(String value) => _nextPageUrl = value;

  set paginaAtual(int value) => _paginaAtual = value;

  Paginacao.fromJson(Map<String, dynamic> json) {
    json['current_page'] = this._paginaAtual;
    json['next_page_url'] = this._nextPageUrl;
    json['total'] = this._totalCount;
    json['per_page'] = this._resultadosPorPagina;
  }
}
