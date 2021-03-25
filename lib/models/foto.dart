import 'dart:io';

import 'package:flutter/foundation.dart';

class LocalizacaoFoto {
  final double latitude;
  final double longitude;
  final String endereco;

  LocalizacaoFoto({
    @required this.latitude,
    @required this.longitude,
    @required this.endereco,
  });
}

class Foto {
  final String id;
  final String titulo;
  final File imagem;
  final LocalizacaoFoto localizacao;

  Foto({
    @required this.id,
    @required this.titulo,
    @required this.imagem,
    @required this.localizacao,
  });
}
