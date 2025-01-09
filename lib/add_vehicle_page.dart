import 'package:flutter/material.dart';

class AddVehiclePage extends StatefulWidget {
  final Function(String, String, String, String) onAddVehicle;

  AddVehiclePage({required this.onAddVehicle});

  @override
  _AddVehiclePageState createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _makeController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dodaj ogłoszenie')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _makeController,
                decoration: InputDecoration(labelText: 'Marka'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Proszę podać markę pojazdu';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _modelController,
                decoration: InputDecoration(labelText: 'Model'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Proszę podać model pojazdu';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _yearController,
                decoration: InputDecoration(labelText: 'Rok produkcji'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Proszę podać rok produkcji';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Cena'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Proszę podać cenę pojazdu';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Przesyłanie danych ogłoszenia
                      widget.onAddVehicle(
                        _makeController.text,
                        _modelController.text,
                        _yearController.text,
                        _priceController.text,
                      );
                      Navigator.pop(context); // Powrót do poprzedniej strony
                    }
                  },
                  child: Text('Dodaj pojazd'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}