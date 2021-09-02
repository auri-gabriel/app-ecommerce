import 'package:app/components/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class HorizontalList extends StatefulWidget {
  const HorizontalList({Key? key}) : super(key: key);

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            IconHorizontalList(
              icon: TablerIcons.shirt,
              name: 'Roupas',
              color: Colors.black,
              path: 'home',
            ),
            IconHorizontalList(
              icon: TablerIcons.device_tv,
              name: 'SmartTvs',
              color: Colors.black,
              path: 'smartvs',
            ),
            IconHorizontalList(
              icon: TablerIcons.device_mobile,
              name: 'Smartphones',
              color: Colors.black,
              path: 'smartphones',
            ),
            IconHorizontalList(
              icon: TablerIcons.device_laptop,
              name: 'Notebooks',
              color: Colors.black,
              path: 'notebooks',
            ),
            IconHorizontalList(
              icon: Icons.games,
              name: 'Games',
              color: Colors.black,
              path: 'games',
            ),
          ],
        ),
      ),
    );
  }
}
