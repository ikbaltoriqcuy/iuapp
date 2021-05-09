
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:iu_app/utils/Constanta.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.main,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
  int _selectedIndex = 0;
  int _currenPos = 0;
  List<String> _iuImage = [
    "${Constanta.image}iu_1.png",
    "${Constanta.image}iu_2.jpg",
    "${Constanta.image}iu_3.jpg",
    "${Constanta.image}iu_4.jpg",
    "${Constanta.image}iu_5.jpg"
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _next() {
    setState(() {
      if (_currenPos < _iuImage.length - 1) {
        _currenPos++;
      } else {
        _currenPos = _currenPos ;
      }
    });
  }

  void _previous() {
    setState(() {
      if (_currenPos > 0) {
        _currenPos--;
      } else {
        _currenPos = 0 ;
      }
    });
  }

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onHorizontalDragEnd: (DragEndDetails drag) {
              if (drag.velocity.pixelsPerSecond.dx>0) {
                _previous();
              } else {
                _next();
              }
            },
            child: Container(
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_iuImage[_currenPos]),
                  fit: BoxFit.cover
                )
              ),
              child: Stack (
                alignment: Alignment(1,1.1),
                children: <Widget>[
                    Container (
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                            Colors.black.withOpacity(0.9),
                            Colors.black.withOpacity(0),
                          ]
                        )
                      ),
                    ),
                    RawMaterialButton(
                      onPressed: () {},
                      elevation: 5.0,
                      fillColor: Colors.main,
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                        size: 35.0,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ) ,
                ]
              )
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 36, 16, 16),
            child: Text(Constanta.iuInfo, style: TextStyle(fontSize: 16),),
          ),
        ],
      ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: "business",
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: onItemTapped,
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
