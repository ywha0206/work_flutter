import 'package:flutter/material.dart';

class RecipeMenu extends StatelessWidget {
  const RecipeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildMenuIcon(Icons.food_bank, 'ALL'),
        SizedBox(width: 25),
        _buildMenuIcon(Icons.food_bank, 'Coffee'),
        SizedBox(width: 25),
        _buildMenuIcon(Icons.food_bank, 'Burger'),
        SizedBox(width: 25),
        _buildMenuIcon(Icons.food_bank, 'Pizza'),
      ],
    );
  }

  Widget _buildMenuIcon(IconData icon, String text) {
    return Container(
      width: 80,
      height: 110,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.red),
          SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(color: Colors.black87),
          )
        ],
      ),
    );
  }
}
