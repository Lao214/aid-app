import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/help_page.dart';
import 'pages/about_page.dart';


class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {

  int _currentIndex = 0;
  List<Widget> lists = [];

  @override
  void initState() {
    lists..add(MyHomePage())
      ..add(HelpPage())
      ..add(AboutPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 14,
          selectedItemColor: Colors.teal,
          currentIndex:  _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.help_center), label: 'Help'),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: 'About')
          ],
        ),
        // appBar: AppBar(title: Text('Bottom-Navigation-Widget'),),
        body:  lists[_currentIndex]
    );
  }
}
