import 'package:flutter/material.dart';
import 'package:restaurantapp/carnesmenu.dart';
import 'package:restaurantapp/pescadosmenu.dart'; // Asegúrate de que este nombre de archivo sea correcto // Asegúrate de que este nombre de archivo sea correcto
import 'package:restaurantapp/pastasmenu.dart';
import 'package:restaurantapp/pollosmenu.dart';

class ScheduleSelector extends StatefulWidget {
  @override
  _ScheduleSelector createState() => _ScheduleSelector();
}

class _ScheduleSelector extends State<ScheduleSelector> {
  double buttonWidth = 310;

  Widget _buildCategoryCard(String title, String imagePath, Widget destinationScreen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => destinationScreen,
          ),
        );
      },
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            Image.asset(
              imagePath,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => destinationScreen,
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.brown),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              child: Text(
                'Explorar',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Fondo de imagen
          Image.asset(
            'assets/images/pescado.png',
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'RestaurantApp - Selector de Categorías',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Pantalla de categorías
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCategoryCard('Carnes', 'assets/images/carnes.png', CarnesMenu()),
                    _buildCategoryCard('Pescados', 'assets/images/pescados.png', PescadosMenu()),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCategoryCard('Pollos', 'assets/images/pollos.png', PollosMenu()),
                    _buildCategoryCard('Pastas', 'assets/images/pastas.png', PastasMenu()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}