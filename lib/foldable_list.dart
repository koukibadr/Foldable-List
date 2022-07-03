import 'package:flutter/material.dart';
import 'package:foldable_list/resources/arrays.dart';

class FoldableList extends StatefulWidget {
  FoldableList(
      {required this.foldableItems,
      required this.items,
      this.animationDuration = const Duration(milliseconds: 500),
      this.animationType = AnimationType.none});

  ///List of expanded items, when the user click on item
  ///an item with the same index will be shown from this list
  ///
  final List<Widget> foldableItems;

  ///List of foldable widgets, default displayed list
  ///
  final List<Widget> items;

  ///The duration of the animation applied on the items
  ///
  final Duration animationDuration;

  ///The type of animation, values can be:
  ///```dart
  ///{
  ///NONE,
  ///SIZE_TRANSITION,
  ///SCALE
  ///}
  ///```
  ///by default it's set to [ANIMATION_TYPE.NONE
  ///]
  final AnimationType animationType;

  @override
  _FoldableListState createState() => _FoldableListState();
}

class _FoldableListState extends State<FoldableList>
    with SingleTickerProviderStateMixin {
  ///The actual displayed list of widget in the list view
  ///
  List<Widget> displayedList = [];

  ///The animation controller
  ///
  late AnimationController expandController;

  ///the animation value
  ///
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
    displayedList.addAll(this.widget.items);
  }

  ///initialize the animation attributes
  ///
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

  ///invoked when an item on the list is clicked,
  ///update the item in [position] with an item from [widget.foldableItems]
  ///
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

  ///render the new selected item with the selected animation type
  ///[widget] the selected item that will be shown as foldable
  ///
  _renderFoldableItem(Widget widget) {
    switch (this.widget.animationType) {
      case AnimationType.scale:
        return ScaleTransition(
            scale: animation,
            child: Container(
                width: MediaQuery.of(context).size.width, child: widget));
      case AnimationType.sizeTransition:
        return SizeTransition(
            sizeFactor: animation,
            child: Container(
                width: MediaQuery.of(context).size.width, child: widget));
      default:
        return widget;
    }
  }
}
