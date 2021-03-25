import 'dart:io';

import 'package:flutter/material.dart';
import 'package:imagens/providers/fotos.dart';
import 'package:imagens/widgets/input_image.dart';
import 'package:provider/provider.dart';

class ScreenFotoForm extends StatefulWidget {
  @override
  _ScreenFotoFormState createState() => _ScreenFotoFormState();
}

class _ScreenFotoFormState extends State<ScreenFotoForm> {
  final _tituloController = TextEditingController();

  File _pickedImage;

  void _imagemSelecionada(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _submitForm() {
    if (_tituloController.text.isEmpty || _pickedImage == null) {
      return;
    }

    Provider.of<Fotos>(context, listen: false)
        .addFoto(_tituloController.text, _pickedImage);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova foto'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _tituloController,
                      decoration: InputDecoration(
                        labelText: 'Título',
                      ),
                    ),
                    SizedBox(width: 10),
                    InputImage(this._imagemSelecionada),
                  ],
                ),
              ),
            ),
          ),
          RaisedButton.icon(
            onPressed: _submitForm,
            icon: Icon(Icons.add),
            label: Text('Adicionar'),
            color: Theme.of(context).accentColor,
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          )
        ],
      ),
    );
  }
}
