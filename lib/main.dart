import 'package:flutter/material.dart';
import 'package:imagens/providers/fotos.dart';
import 'package:imagens/screens/screen_foto_form.dart';
import 'package:imagens/screens/screen_home.dart';
import 'package:imagens/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Fotos(),
      child: MaterialApp(
        title: 'Minhas fotos',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.greenAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ScreenHome(),
        routes: {
          AppRoutes.FOTO_FORM: (ctx) => ScreenFotoForm(),
        },
      ),
    );
  }
}
