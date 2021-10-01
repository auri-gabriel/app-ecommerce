import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IconHorizontalList extends StatefulWidget {
  const IconHorizontalList({
    this.icon = Icons.face,
    this.name = 'Insira o nome',
    this.color = Colors.red,
    this.path = 'path',
  });

  final IconData icon;
  final String name;
  final Color color;
  final String path;

  @override
  State<IconHorizontalList> createState() => _IconHorizontalListState();
}

class _IconHorizontalListState extends State<IconHorizontalList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffeeeeee), width: 2.0),
        color: Colors.white38,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
              child: IconButton(
            alignment: Alignment.center,
            onPressed: () {
              Navigator.of(context).pushReplacementNamed("/${widget.path}");
            },
            icon: Icon(widget.icon),
            iconSize: 30.0,
            color: widget.color,
          )),
          Text(
            widget.name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10.0,
                color: widget.color),
          ),
        ],
      ),
    );
  }
}
