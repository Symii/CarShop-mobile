import 'package:flutter/material.dart';
import 'package:untitled2dfghgf/chat_screen.dart';
import 'package:untitled2dfghgf/sell_screen.dart';

import 'profile_screen.dart';
import 'home_screen.dart';
import 'favorite_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    FavoriteScreen(),
    SellScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ogłoszenia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 11, color: Colors.black),
          unselectedLabelStyle: TextStyle(fontSize: 11, color: Colors.black54),
          selectedIconTheme: IconThemeData(size: 24),
        ),
      ),
      home: Scaffold(
        appBar: _selectedIndex == 0 ? AppBar(
          title: Image.asset(
            'assets/carshop.png',
            height: 30,
          ),
        ) : null,
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 24),
              label: 'Kupujesz',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, size: 24),
              label: 'Ulubione',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add, size: 24),
              label: 'Sprzedaż',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat, size: 24),
              label: 'Wiadomości',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, size: 24),
              label: 'Konto',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          showSelectedLabels: true,  // Wymusza wyświetlanie etykiet przy zaznaczeniu
          showUnselectedLabels: true,  // Wymusza wyświetlanie etykiet przy niezaznaczonych elementach
        ),
      ),
    );
  }
}
