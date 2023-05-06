

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Recipe {
  final String name;
  final String ingredients;
  final String imageUrl;
  final List<String> steps;

  Recipe({required this.name, required this.ingredients, required this.imageUrl, required this.steps});
}
class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(recipe.imageUrl),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Ingredients:',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 20.0),
                  Text(recipe.ingredients),
                  SizedBox(height: 20.0),
                  Text(
                    'Steps:',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 10.0),
                  Column(
                    children: recipe.steps
                        .map((step) => Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(step),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}