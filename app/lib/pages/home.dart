import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            autoPlay: true,
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
              onTap: () {},
              child: ListTile(
                title: Text('Minha Conta'),
                leading: Icon(TablerIcons.user),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favoritos'),
                leading: Icon(Icons.favorite),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Status do pedido'),
                leading: Icon(TablerIcons.truck_delivery),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Promoções'),
                leading: Icon(Icons.local_offer_outlined),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Central de Atendimento'),
                leading: Icon(Icons.help),
              ),
            ),
            InkWell(
              onTap: () {},
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
