import 'dart:async';

import 'package:flutter/material.dart';

class FoldableList extends StatefulWidget {
  final List<Widget> foldableItems;
  final List<Widget> items;

  FoldableList({required this.foldableItems, required this.items});

  @override
  _FoldableListState createState() => _FoldableListState();
}

class _FoldableListState extends State<FoldableList> {
  List<Widget> displayedList = [];
  int currentSelectedItem = 0;

  @override
  void initState() {
    super.initState();
    displayedList.addAll(this.widget.items);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.displayedList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            _updateSelectedItem(index);
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: this.displayedList[index],
          ),
        );
      },
    );
  }

  _updateSelectedItem(position) {
    displayedList.clear();
    displayedList.addAll(this.widget.items);
    setState(() {
        displayedList[position] = this.widget.foldableItems[position];
    });
    // displayedList[currentSelectedItem] = this.widget.items[currentSelectedItem];
    // setState(() {
    //   displayedList[position] = this.widget.foldableItems[position];
    //   currentSelectedItem = position;
    // });
  }
}
