import 'package:flutter/material.dart';
import 'models/global.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: TabBar(
            tabs: [
              Tab(
                icon: new Icon(Icons.calendar_today),
              ),
              Tab(
                icon: new Icon(Icons.add),
              ),
              Tab(
                icon: new Icon(Icons.menu_sharp),
              ),
            ],
            labelColor: darkGreyColour,
            unselectedLabelColor: Colors.indigo.shade200,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: darkGreyColour,
          ),
        ),
        body: Stack(
          children: [
            TabBarView(
              children: [
                Container(
                  color: Colors.grey,
                ),
                Container(
                  color: Colors.grey,
                ),
                Container(
                  color: Colors.grey,
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 35),
              height: 155,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Intray", style: intrayTitleStyle),
                  Container()
                ],
              ),
            ),
            Container(
              height: 70,
              width: 70,
              margin: EdgeInsets.only(
                  top: 120, left: MediaQuery.of(context).size.width * 0.5 - 35),
              child: FloatingActionButton(
                child: Icon(
                  Icons.add,
                  size: 60,
                ),
                backgroundColor: redColour,
                onPressed: null,
              ),
            )
          ],
        ),
      ),
    );
  }
}
