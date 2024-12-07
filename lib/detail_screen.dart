import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {

  final int index;

  DetailScreen(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Volkswagen Arteon'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Zdjęcie samochodu
          Image.asset(
            'assets/images/car_3.jpg',
            height: 300,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16),
          // Tytuł ogłoszenia
          Text(
            'Volkswagen Arteon 2.0 TSI Elegance DSG',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          // Rok produkcji i status używany
          Text(
            'Używany · 2018',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
          SizedBox(height: 16),
          // Cena i finansowanie
          Row(
            children: [
              Text(
                '89 900 PLN',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ],
          ),
          SizedBox(height: 24),
          // Najważniejsze informacje
          SectionTitle('Najważniejsze'),
          InfoItem('Przebieg', '102,000 km'),
          InfoItem('Rodzaj paliwa', 'Benzyna'),
          InfoItem('Skrzynia biegów', 'DSG'),
          SizedBox(height: 24),
          // Akcje na dole (Zadzwoń, Napisz)
          ActionButtons(),
        ],
      ),
    );
  }
}

// Widget dla nagłówka sekcji
class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// Widget dla pojedynczego elementu informacji
class InfoItem extends StatelessWidget {
  final String label;
  final String value;

  InfoItem(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget dla przycisków na dole ekranu
class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
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
    );
  }
}