import 'package:flutter/material.dart';
import 'package:sphere_bottom_navigation_bar/sphere_bottom_navigation_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String text = ':) Home';
  Color backgroudColor = Color(0xFFFFD6B2);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroudColor,
      appBar: AppBar(
        backgroundColor: backgroudColor,
        title: Center(
            child: Text(
          'Sphere Bottom Navigation',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 5),
        )),
        elevation: 0,
      ),
      bottomNavigationBar: SphereBottomNavigationBar(
        defaultSelectedItem: 0,
        sheetRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        onItemPressed: (index) => setState(() {
              print('Selected item is - $index');
              switch (index) {
                case 0:
                  text = ':) Home';
                  backgroudColor = Color(0xFFFFD6B2);
                  break;
                case 1:
                  text = ':) Chat';
                  backgroudColor = Color(0xFFB2F4FF);
                  break;
                case 2:
                  text = ':) Peoples';
                  backgroudColor = Color(0xFFCDB2FF);
                  break;
                case 3:
                  text = ':) Settings';
                  backgroudColor = Color(0xFFFFB2D9);
                  break;
                default:
              }
            }),
        onItemLongPressed: (index) => setState(() {
              backgroudColor = Color(0xFF44D6B2);
            }),
        navigationItems: [
          BuildNavigationItem(
            tooltip: 'Home',
            itemColor: Color(0xFFFFD6B2),
            icon: Icon(Icons.home),
            selectedItemColor: Color(0xFFFFD6B2),
          ),
          BuildNavigationItem(
            tooltip: 'Chat',
            itemColor: Color(0xFFB2F4FF),
            icon: Icon(Icons.chat),
            selectedItemColor: Color(0xFFB2F4FF),
          ),
          BuildNavigationItem(
            tooltip: 'Peoples',
            itemColor: Color(0xFFCDB2FF),
            icon: Icon(Icons.people),
            selectedItemColor: Color(0xFFCDB2FF),
          ),
          BuildNavigationItem(
              tooltip: 'Settings',
              itemColor: Color(0xFFFFB2D9),
              icon: Icon(Icons.settings),
              selectedItemColor: Color(0xFFFFB2D9)),
        ],
      ),
      body: Container(
        color: backgroudColor,
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Container(
              height: 600,
              width: 360,
              child: Center(
                child: AnimatedDefaultTextStyle(
                  style: TextStyle(fontSize: 26, color: Colors.white),
                  duration: Duration(milliseconds: 500),
                  child: Text(
                    text,
                    style: TextStyle(
                        color: backgroudColor,
                        fontSize: 46,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
