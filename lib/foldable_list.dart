import 'package:flutter/material.dart';
import 'package:foldable_list/resources/arrays.dart';

class FoldableList extends StatefulWidget {
  final List<Widget> foldableItems;
  final List<Widget> items;
  final Duration animationDuration;
  final ANIMATION_TYPE animationType;

  FoldableList(
      {required this.foldableItems,
      required this.items,
      this.animationDuration = const Duration(milliseconds: 500),
      this.animationType = ANIMATION_TYPE.NONE});

  @override
  _FoldableListState createState() => _FoldableListState();
}

class _FoldableListState extends State<FoldableList>
    with SingleTickerProviderStateMixin {
  List<Widget> displayedList = [];
  int currentSelectedItem = 0;

  late AnimationController expandController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
    displayedList.addAll(this.widget.items);
  }

  _initializeAnimation() {
    expandController = AnimationController(
        vsync: this, duration: this.widget.animationDuration);
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.ease,
    );
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
    expandController.reset();
    displayedList.addAll(this.widget.items);
    setState(() {
      displayedList[position] =
          _renderFoldableItem(this.widget.foldableItems[position]);
      expandController.forward();
    });
  }

  _renderFoldableItem(Widget widget) {
    switch (this.widget.animationType) {
      case ANIMATION_TYPE.SCALE:
        return ScaleTransition(
            scale: animation,
            child: Container(
                width: MediaQuery.of(context).size.width, child: widget));
      case ANIMATION_TYPE.SIZE_TRANSITION:
        return SizeTransition(
            sizeFactor: animation,
            child: Container(
                width: MediaQuery.of(context).size.width, child: widget));
      default:
        return widget;
    }
  }
}
