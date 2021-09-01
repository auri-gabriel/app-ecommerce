import 'package:app/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/minhaconta': (context) => MinhaConta(),
        '/favoritos': (context) => Favoritos(),
        '/status_pedido': (context) => StatusPedido(),
        '/promocoes': (context) => Promocoes(),
        '/central': (context) => CentralAtendimento(),
        '/compre_wttp': (context) => CompraWhatsapp(),
      },
    ),
  );
}
