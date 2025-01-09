import 'package:flutter/material.dart';

class VehicleDetailsPage extends StatelessWidget {
  final Map<String, String> vehicle;

  VehicleDetailsPage({required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${vehicle["make"]} ${vehicle["model"]}'),
        backgroundColor: Colors.blue,  // Kolor tła AppBar
      ),
      body: ListView(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(vehicle["imageUrl"] ?? 'assets/images/audi-a5.jpg'),  // Ścieżka do obrazka
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${vehicle["make"]} ${vehicle["model"]}',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '${vehicle["year"]} r.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '${vehicle["price"]} PLN',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Lub od ${(96400 / 60).toStringAsFixed(2)} PLN/mc - RRSO 16%',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Najważniejsze:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: <Widget>[
                    Icon(Icons.directions_car, size: 30),
                    SizedBox(width: 8),
                    Text('Przebieg: TODO km'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.local_gas_station, size: 30),
                    SizedBox(width: 8),
                    Text('Rodzaj paliwa: TODO'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.speed, size: 30),
                    SizedBox(width: 8),
                    Text('Skrzynia biegów: TODO'),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.phone),
                  label: Text('Zadzwoń'),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.message),
                  label: Text('Napisz'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}