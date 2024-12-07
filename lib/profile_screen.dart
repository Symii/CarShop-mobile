import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Przechowywane dane profilu
  String name = "Jan Kowalski";
  String email = "jan.kowalski@example.com";
  String phone = "+48 123 456 789";
  String address = "Warszawa, Polska";

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
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            SizedBox(height: 16),
            Text(name, style: TextStyle(fontSize: 24)),
            SizedBox(height: 8),
            Text(email),
            SizedBox(height: 8),
            Text(phone),
            SizedBox(height: 8),
            Text(address),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                // Przechodzimy do ekranu edycji profilu
                final updatedProfile = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfileScreen(
                      name: name,
                      email: email,
                      phone: phone,
                      address: address,
                    ),
                  ),
                );

                // Jeśli użytkownik zaktualizował dane, odświeżamy je na ekranie
                if (updatedProfile != null) {
                  setState(() {
                    name = updatedProfile['name'];
                    email = updatedProfile['email'];
                    phone = updatedProfile['phone'];
                    address = updatedProfile['address'];
                  });
                }
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