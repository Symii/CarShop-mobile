import 'package:flutter/material.dart';
import "detail_screen.dart";
import 'dart:math';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  final random = Random();
  final formatter = NumberFormat("###,###", "pl_PL");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ogłoszenia'),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.search),
        //     onPressed: () {
        //       // Przejście do filtrów (FilterScreen)
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => FilterScreen()),
        //       );
        //     },
        //   ),
        // ],
      ),
      body: ListView.builder(
        itemCount: 5, // Ilość ogłoszeń do wyświetlenia
        itemBuilder: (context, index) {
          // Placeholder data
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              onTap: () {
                // Przejście do szczegółowego widoku ogłoszenia
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(index),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Obraz samochodu
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(
                      index % 2 == 0 ? 'assets/images/car_1.jpg' : 'assets/images/car_3.jpg',
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Tytuł samochodu
                        Text(
                          index % 2 == 0 ? 'Audi A4 2018 40 TDI S-Tronic SPORT S-Line' : 'Volkswagen Arteon 2.0 TSI Elegance DSG',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        // Opis samochodu
                        Text(
                          'Opis ogłoszenia ${index + 1}',
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: 8),
                        // Cena samochodu
                        Text(
                          '${formatter.format(5000 + random.nextInt(100000)).replaceAll(',', ' ')} PLN',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}