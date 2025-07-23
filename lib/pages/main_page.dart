import 'package:bildergalerie/logic/style/style_manager.dart';
import 'package:bildergalerie/pages/gallery.dart';
import 'package:bildergalerie/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [MyGallery(), MyProfil()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final style = Provider.of<StyleManager>(context).style;

    return Scaffold(
      /* Gallerie / Profil */
      body: _pages[_selectedIndex],

      /*  Nav-Bar */
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,

        /* Color */
        backgroundColor: style.label,
        indicatorColor: style.navBarSelect,
        labelTextStyle: WidgetStatePropertyAll(style.navButton),

        /* Animation  */
        animationDuration: const Duration(milliseconds: 100),

        destinations: [
          /* Gallerie */
          NavigationDestination(
            icon: Icon(Icons.newspaper, color: style.navBarIcon),
            label: 'News',
          ),

          /* Profil */
          NavigationDestination(
            icon: Icon(Icons.person, color: style.navBarIcon),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
