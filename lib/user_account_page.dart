import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';

class UserAccountPage extends StatefulWidget {
  @override
  _UserAccountPageState createState() => _UserAccountPageState();
}

class _UserAccountPageState extends State<UserAccountPage> {
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