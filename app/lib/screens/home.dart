import 'dart:convert';
import 'dart:io';

import 'package:app/components/horizontal_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart' as convert;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<dynamic> _getProduct() async {
    var url = d
    var data = await http
        .get(Uri.https('www.fakestoreapi.com', '/products', {'q': '{http}'}));

    var jsonData = jsonDecode(data.body);

    List<Product> products = [];

    for (var p in jsonData) {
      Product product = Product(p["id"], p["title"], p["price"],
          p["description"], p["category"], p["image"]);

      products.add(product);
    }

    print(products.length);
  }

  @override
  Widget build(BuildContext context) {
    final urlImages = [
      "https://www.casasbahia-imagens.com.br/Control/ArquivoExibir.aspx?IdArquivo=1238925806",
      "https://cdn.leroymerlin.com.br/products/smart_tv_led_50_polegadas_4k_com_comando_de_voz_tcl_50p8m_1566901170_e85a_600x600.jpeg"
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Logo(),
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 200,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayAnimationDuration: Duration(seconds: 2),
            ),
            items: urlImages
                .map(
                  (e) => SizedBox(
                    child: Image.network(
                      e,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
                .toList(),
          ),
          HorizontalList(),
          SizedBox(height: 20),
          Container(
              child: FutureBuilder(
                  future: _getProduct(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xffeeeeee), width: 2.0),
                              color: Colors.white38,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white24,
                                  blurRadius: 4,
                                  spreadRadius: 2,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            margin: EdgeInsets.all(7),
                            height: 80,
                            width: 65,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Center(
                                  child: SizedBox(
                                      child: Image.network(
                                          snapshot.data[index].image)),
                                )
                              ],
                            ),
                          );
                        });
                  })),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Evandro Correa'),
              accountEmail: Text('evandrosoares.aluno@unipampa.edu.br'),
              arrowColor: Colors.white,
              decoration: BoxDecoration(color: Colors.black),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed("/minhaconta");
              },
              child: ListTile(
                title: Text('Minha Conta'),
                leading: Icon(TablerIcons.user),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed("/favoritos");
              },
              child: ListTile(
                title: Text('Favoritos'),
                leading: Icon(Icons.favorite),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed("/status_pedido");
              },
              child: ListTile(
                title: Text('Status do pedido'),
                leading: Icon(TablerIcons.truck_delivery),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed("/promocoes");
              },
              child: ListTile(
                title: Text('Promoções'),
                leading: Icon(Icons.local_offer_outlined),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed("/central");
              },
              child: ListTile(
                title: Text('Central de Atendimento'),
                leading: Icon(Icons.help),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed("/compra_wttp");
              },
              child: ListTile(
                title: Text('Compre pelo Whatsapp'),
                leading: Icon(TablerIcons.brand_whatsapp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;

  Product(this.id, this.title, this.price, this.description, this.category,
      this.image);
}

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        text: 'bolicho',
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: 'Inter',
        ),
        children: [
          TextSpan(
            text: 'alegrete.com',
            style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontFamily: 'Inter'),
          ),
        ],
      ),
    );
  }
}
