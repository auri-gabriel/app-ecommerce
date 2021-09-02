
import 'package:flutter/material.dart';

import 'screens/criar_cadastro.dart';
import 'screens/drawer/minhaconta.dart';
import 'screens/drawer/recuperar_senha.dart';
import 'screens/home.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/minhaconta': (context) => MinhaConta(),
        '/recuperar_senha': (context) => RecuperarSenha(),
        '/criar_cadastro': (context) => CriarCadastro(),
        //   '/favoritos': (context) => Favoritos(),
        //   '/status_pedido': (context) => StatusPedido(),
        //   '/promocoes': (context) => Promocoes(),
        //   '/central': (context) => CentralAtendimento(),
        //   '/compre_wttp': (context) => CompraWhatsapp(),
        //   '/carrinho': (context) => Carrinho(),
        //   '/roupas': (context) => Roupas(),
      },
    ),
  );
}
