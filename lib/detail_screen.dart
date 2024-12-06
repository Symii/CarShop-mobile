import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final int index;

  DetailScreen(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Szczegóły ogłoszenia'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://via.placeholder.com/300', // Placeholder image URL
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(child: CircularProgressIndicator());
              },
              errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                return Icon(Icons.error, color: Colors.red);
              },
            ),
            SizedBox(height: 16),
            Text(
              'Samochód $index', // Tytuł ogłoszenia
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Opis szczegółowy ogłoszenia $index', // Opis ogłoszenia
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Cena: \$${10000 + index * 1000}', // Cena ogłoszenia
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Zmienna do zarządzania ulubionymi ogłoszeniami
              },
              child: Text('Dodaj do ulubionych'),
            ),
          ],
        ),
      ),
    );
  }
}