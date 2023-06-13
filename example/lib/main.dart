import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circular Bottom Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Directionality(
        // use this property to change direction in whole app
        // CircularBottomNavigation will act accordingly
        textDirection: TextDirection.ltr,
        child: MyHomePage(title: 'circular_bottom_navigation'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
    this.title,
  }) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedPos = 0;

  double bottomNavBarHeight = 60;

  List<TabItem> tabItems = List.of([
    TabItem(
      Icons.home,
      "Home",
      LinearGradient(
        colors: [
          Color(0xff06081B),
          Color(0xff4B3675),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [1.0, 0.5],
      ),
      labelStyle: TextStyle(
        fontWeight: FontWeight.normal,
      ),
      // circleStrokeColor: Colors.transparent
    ),
    TabItem(
      Icons.search,
      "Search",
      LinearGradient(
        colors: [
          Color(0xff06081B),
          Color(0xff4B3675),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [1.0, 0.5],
      ),
      labelStyle: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    TabItem(
      Icons.layers,
      "Reports",
      LinearGradient(
        colors: [
          Color(0xff06081B),
          Color(0xff4B3675),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [1.0, 0.5],
      ),
      circleStrokeColor: Colors.black,
    ),
    TabItem(
      Icons.notifications,
      "Notifications",
      LinearGradient(
        colors: [
          Color(0xff06081B),
          Color(0xff4B3675),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [1.0, 0.5],
      ),
    ),
  ]);

  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            child: bodyContainer(),
            padding: EdgeInsets.only(bottom: bottomNavBarHeight),
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  Widget bodyContainer() {
    // Color? selectedColor = tabItems[selectedPos].circleColor;
    Color? selectedColor = Colors.blue;

    String slogan;
    switch (selectedPos) {
      case 0:
        slogan = "Family, Happiness, Food";
        break;
      case 1:
        slogan = "Find, Check, Use";
        break;
      case 2:
        slogan = "Receive, Review, Rip";
        break;
      case 3:
        slogan = "Noise, Panic, Ignore";
        break;
      default:
        slogan = "";
        break;
    }

    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: selectedColor,
        child: Center(
          child: Text(
            slogan,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      onTap: () {
        if (_navigationController.value == tabItems.length - 1) {
          _navigationController.value = 0;
        } else {
          _navigationController.value = _navigationController.value! + 1;
        }
      },
    );
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,

      controller: _navigationController,
      selectedPos: selectedPos,
      circleSize: 64,
      iconsSize: 20,

      barHeight: 74,
      // use either barBackgroundColor or barBackgroundGradient to have a gradient on bar background
      // barBackgroundColor: Colors.white,
      barBackgroundGradient: LinearGradient(
        colors: [
          Color(0xff06081B),
          Color(0xff4B3675),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [1.0, 1.0],
      ),
      // backgroundBoxShadow: <BoxShadow>[
      //   BoxShadow(color: Colors.black45, blurRadius: 10.0),
      // ],
      animationDuration: Duration(milliseconds: 300),
      selectedCallback: (int? selectedPos) {
        setState(() {
          this.selectedPos = selectedPos ?? 0;
          print(_navigationController.value);
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
