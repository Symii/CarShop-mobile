import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  final String address;

  EditProfileScreen({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;

  @override
  void initState() {
    super.initState();
    // Inicjalizujemy kontrolery z aktualnymi danymi
    nameController = TextEditingController(text: widget.name);
    emailController = TextEditingController(text: widget.email);
    phoneController = TextEditingController(text: widget.phone);
    addressController = TextEditingController(text: widget.address);
  }

  @override
  void dispose() {
    // Czyszczenie kontrolerów
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edytuj profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Imię i nazwisko'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'E-mail'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Numer telefonu'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Adres'),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Przekazujemy zaktualizowane dane do ekranu głównego
                Navigator.pop(context, {
                  'name': nameController.text,
                  'email': emailController.text,
                  'phone': phoneController.text,
                  'address': addressController.text,
                });
              },
              child: Text('Zapisz'),
            ),
          ],
        ),
      ),
    );
  }
}