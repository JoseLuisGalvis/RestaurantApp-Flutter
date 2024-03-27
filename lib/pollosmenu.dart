import 'package:flutter/material.dart';


class PollosMenu extends StatefulWidget {
  @override
  _PollosMenu createState() => _PollosMenu();
}

class _PollosMenu extends State<PollosMenu> {
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
            'assets/images/pollo.png',
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
                    'RestaurantApp - Pollos',
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
                    _buildCategoryCard('Pollo tikka masala', 'assets/images/tikka.png', context),
                    _buildCategoryCard('Curry de pollo tailandés', 'assets/images/curry.png', context),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCategoryCard('Pollo a la brasa', 'assets/images/brasa.png', context),
                    _buildCategoryCard('Chijeu-buldak ', 'assets/images/chijeu.png', context),
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
