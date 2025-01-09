import 'package:flutter/material.dart';
import 'add_vehicle_page.dart';
import 'vehicle_details_page.dart';

class VehicleListPage extends StatefulWidget {
  @override
  _VehicleListPageState createState() => _VehicleListPageState();
}

class _VehicleListPageState extends State<VehicleListPage> {
  List<Map<String, String>> vehicles = [];

  void _addVehicle(String make, String model, String year, String price) {
    setState(() {
      vehicles.add({
        "make": make,
        "model": model,
        "year": year,
        "price": price,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kupujesz - Lista pojazdów')),
      body: vehicles.isEmpty
          ? Center(child: Text('Brak dodanych pojazdów'))
          : ListView.builder(
        itemCount: vehicles.length,
        itemBuilder: (context, index) {
          bool isFirstItem = index == 0;

          return Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
              border: isFirstItem ? Border.all(color: Colors.blue, width: 2) : Border.all(color: Colors.black, width: 2), // Ramka dla pierwszego elementu
              borderRadius: BorderRadius.circular(10),
            ),
            child: GestureDetector(
              onTap: () {
                // Nawigacja do szczegółów pojazdu
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VehicleDetailsPage(vehicle: vehicles[index]),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.asset(
                      "assets/images/audi-a5.jpg",
                      width: double.infinity, // Zajmuje całą szerokość
                      height: 200, // Ustalamy stałą wysokość dla zdjęcia
                      fit: BoxFit.cover, // Ustawienie dopasowania obrazu
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${vehicles[index]["make"]} ${vehicles[index]["model"]}',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(height: 5),
                        Text('Rok: ${vehicles[index]["year"]} | Cena: ${vehicles[index]["price"]} PLN'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddVehiclePage(onAddVehicle: _addVehicle),
            ),
          );
        },
        child: Icon(Icons.add),
        tooltip: 'Dodaj pojazd',
      ),
    );
  }
}