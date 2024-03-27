import 'package:flutter/material.dart';


class PastasMenu extends StatefulWidget {
  @override
  _PastasMenu createState() => _PastasMenu();
}

class _PastasMenu extends State<PastasMenu> {
  double buttonWidth = 310;

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
            'assets/images/pasta.png',
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
                    'RestaurantApp - Pastas',
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
                    _buildCategoryCard('Spaghetti alla Carbonara', 'assets/images/carbonara.png', context),
                    _buildCategoryCard('Lasagna', 'assets/images/lasagna.png', context),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCategoryCard('Ravioli', 'assets/images/ravioli.png', context),
                    _buildCategoryCard('Fettuccine Alfredo', 'assets/images/alfredo.png', context),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, String imagePath, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navegar a la lista de recetas correspondiente a la categoría seleccionada
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeListScreen(category: title),
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

            // Incluir Descripcion del Plato

          ],
        ),
      ),
    );
  }
}

class RecipeListScreen extends StatelessWidget {
  final String category;

  RecipeListScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category Recipes'),
      ),
      body: Center(
        child: Text('List of $category Recipes'),
      ),
    );
  }
}

