import 'package:flutter/material.dart';
import 'package:the_code_brothers/presentation/pages/comments/comments_view.dart';
import 'package:the_code_brothers/presentation/pages/gallery/gallery_view.dart';
import 'package:the_code_brothers/presentation/styles/app_typography.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = AppTypography.h1;
  static const List<Widget> _widgetOptions = <Widget>[
    GalleryView(title: "Gallery view"),
    CommentsView(title: 'Comments View'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment),
            label: 'Comments',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
