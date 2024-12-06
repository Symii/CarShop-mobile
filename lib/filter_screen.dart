import 'package:flutter/material.dart';
import "detail_screen.dart";

class FilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtruj ogłoszenia'),
      ),
      body: ListView.builder(
        itemCount: 10, // Ilość ogłoszeń do wyświetlenia
        itemBuilder: (context, index) {
          // Placeholder data
          return ListTile(
            leading: Image.network(
              'https://via.placeholder.com/150', // Placeholder image URL
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return CircularProgressIndicator();
              },
              errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                return Icon(Icons.error, color: Colors.red);
              },
            ),
            title: Text('Samochód $index'),
            subtitle: Text('Opis ogłoszenia $index'),
            trailing: Text('\$${10000 + index * 1000}'),
            onTap: () {
              // Przejście do szczegółowego widoku ogłoszenia
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(index),
                ),
              );
            },
          );
        },
      ),
    );
  }
}