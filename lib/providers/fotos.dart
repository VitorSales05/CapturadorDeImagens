import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:imagens/models/foto.dart';
import 'package:imagens/utils/db_util.dart';

class Fotos with ChangeNotifier {
  List<Foto> _itens = [];

  Future<void> buscaTodos() async {
    final dataList = await DbUtil.getData('fotos');
    _itens = dataList
        .map(
          (item) => Foto(
            id: item['id'],
            titulo: item['titulo'],
            imagem: File(item['imagem']),
            localizacao: null,
          ),
        )
        .toList();
    notifyListeners();
  }

  List<Foto> get itens {
    return [..._itens];
  }

  int get itensQuantidade {
    return _itens.length;
  }

  Foto getItem(int index) {
    return _itens[index];
  }

  void addFoto(String titulo, File image) {
    final novaFoto = Foto(
      id: Random().nextDouble().toString(),
      titulo: titulo,
      imagem: image,
      localizacao: null,
    );
    _itens.add(novaFoto);

    DbUtil.insert('fotos', {
      'id': novaFoto.id,
      'titulo': novaFoto.titulo,
      'imagem': novaFoto.imagem.path,
    });
    notifyListeners();
  }
}
