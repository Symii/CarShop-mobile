import 'package:flutter/material.dart';
import 'vehicle_list_page.dart';  // Lista pojazdów
import 'add_vehicle_page.dart';  // Dodawanie ogłoszenia
import 'user_account_page.dart'; // Konto użytkownika
import 'empty_state_page.dart';   // Pusty stan (Ulubione, Wiadomości)

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sprzedaż Pojazdów',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.blue, // Kolor tła menu dolnego
          selectedItemColor: Colors.white, // Kolor wybranych ikon i tekstu
          unselectedItemColor: Colors.white70, // Kolor nie wybranych ikon i tekstu
          showUnselectedLabels: true, // Pokazywanie etykiet dla niewybranych elementów
        ),
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // Lista widoków (ekranów)
  final List<Widget> _screens = [
    VehicleListPage(),   // Kupujesz - lista pojazdów
    EmptyStatePage(title: 'Ulubione'),  // Ulubione (empty state)
    AddVehiclePage(onAddVehicle: (make, model, year, price) {}),  // Sprzedaż - dodawanie pojazdu
    EmptyStatePage(title: 'Wiadomości'),  // Wiadomości (empty state)
    UserAccountPage(),   // Konto użytkownika
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