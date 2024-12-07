import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Empty State Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/empty_state.svg',  // Ścieżka do pliku SVG
              height: 200,  // Wysokość obrazka SVG
              placeholderBuilder: (BuildContext context) => CircularProgressIndicator(),  // Loader podczas ładowania
            ),
            SizedBox(height: 20),
            Text(
              'Brak wyników',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Przepraszamy, ale nie znaleziono żadnych wyników.\nSpróbuj ponownie później.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}