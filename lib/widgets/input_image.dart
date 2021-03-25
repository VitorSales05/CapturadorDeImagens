import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;

class InputImage extends StatefulWidget {
  final Function onSelectImage;

  InputImage(this.onSelectImage);
  @override
  _InputImageState createState() => _InputImageState();
}

class _InputImageState extends State<InputImage> {
  File _storedImage;

  _tiraFoto() async {
    final ImagePicker _picker = ImagePicker();
    PickedFile arquivoImagem = await _picker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    if (arquivoImagem == null) return;

    setState(() {
      _storedImage = File(arquivoImagem.path);
    });

    final appDir = await syspaths.getApplicationDocumentsDirectory();
    String nomeArquivo = path.basename(_storedImage.path);
    final imagemSalva = await _storedImage.copy('${appDir.path}/$nomeArquivo');
    widget.onSelectImage(imagemSalva);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 180,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
          ),
          alignment: Alignment.center,
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : Text('Nenhuma imagem!'),
        ),
        SizedBox(width: 10),
        Expanded(
          child: FlatButton.icon(
            onPressed: _tiraFoto,
            icon: Icon(Icons.camera),
            label: Text('Tirar foto'),
            textColor: Theme.of(context).primaryColor,
          ),
        )
      ],
    );
  }
}
