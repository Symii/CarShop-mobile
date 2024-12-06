import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mój profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              // Placeholder zdjęcia profilowego
            ),
            SizedBox(height: 16),
            Text('Imię i nazwisko', style: TextStyle(fontSize: 24)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Przejście do edycji profilu
              },
              child: Text('Edytuj profil'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Przejście do zarządzania ogłoszeniami
              },
              child: Text('Zarządzaj ogłoszeniami'),
            ),
          ],
        ),
      ),
    );
  }
}