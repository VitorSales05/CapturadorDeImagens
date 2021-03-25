import 'package:flutter/material.dart';
import 'package:imagens/providers/fotos.dart';
import 'package:imagens/utils/app_routes.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas fotos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.FOTO_FORM);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<Fotos>(context, listen: false).buscaTodos(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(child: CircularProgressIndicator())
            : Consumer<Fotos>(
                child: Center(
                  child: Text('Nenhuma foto cadastrada'),
                ),
                builder: (ctx, fotos, ch) => fotos.itensQuantidade == 0
                    ? ch
                    : ListView.builder(
                        itemCount: fotos.itensQuantidade,
                        itemBuilder: (ctx, i) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage: FileImage(fotos.getItem(i).imagem),
                          ),
                          title: Text(fotos.getItem(i).titulo),
                          onTap: () {},
                        ),
                      ),
              ),
      ),
    );
  }
}
