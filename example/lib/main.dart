import 'package:flutter/material.dart';
import 'package:foldable_list/foldable_list.dart';
import 'package:foldable_list/resources/arrays.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Widget> simpleWidgetList;
  late List<Widget> expandedWidgetList;

  @override
  void initState() { 
    super.initState();
    initList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: FoldableList(
          animationType: ANIMATION_TYPE.NONE,
          foldableItems: this.expandedWidgetList, 
          items: this.simpleWidgetList
        ),
      ),
    );
  }

  initList(){
    this.simpleWidgetList = [];
    this.expandedWidgetList = [];
    for (var i = 0; i < 9; i++) {
      this.simpleWidgetList.add(renderSimpleWidget());
      this.expandedWidgetList.add(renderExpandedWidget());
    }
  }

  Widget renderSimpleWidget(){
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.account_circle_outlined),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("John Doe",style: TextStyle(
                  fontWeight: FontWeight.bold
                )),
                Text("Web developer and engineer"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget renderExpandedWidget(){
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.account_circle_outlined),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("John Doe",style: TextStyle(
                  fontWeight: FontWeight.bold
                )),
                Text("Web developer and engineer"),
                Text("Birthday : 22/10/1996"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(onPressed: (){}, child: Text("View Linkedin Profile"))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
