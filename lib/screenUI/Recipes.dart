import 'package:flutter/material.dart';
import 'package:my_cook_book/recipe/Recipe.dart';

class RecipeList extends StatelessWidget {
  final List<Recipe> _recipes = [
    Recipe(
        name: 'Pizza',
        ingredients: 'Flour, Tomato Sauce, Cheese, Toppings',
        imageUrl:
            'assets/pizza.jpg',
        steps: [
          'Preheat oven to 425°F.',
          'Roll out pizza dough on a floured surface.',
          'Spread tomato sauce over dough, leaving a small border.',
          'Add cheese and toppings of your choice.',
          'Bake for 15-20 minutes or until crust is golden brown.',
        ]),
    Recipe(
        name: 'Burger',
        ingredients: 'bread, Tomato Sauce, Cheese, chiken',
        imageUrl:
            'assets/burger.jpg',
        steps: [
          'Preheat oven to 375°F.',
          'Cook lasagna noodles according to package instructions.',
          'In a pan, brown ground beef until fully cooked.',
          'In a separate bowl, mix together tomato sauce and cheese.',
          'In a 9x13 inch baking dish, layer cooked noodles, ground beef, and tomato sauce mixture.',
          'Repeat until all ingredients have been used, ending with a layer of tomato sauce mixture on top.',
          'Bake for 30-35 minutes or until cheese is melted and bubbly.',
        ]),
    Recipe(
        name: 'lasagn',
        ingredients: 'Flour, Sugar, Eggs, Butter',
        imageUrl:
            'assets/l.jpg',
        steps: [
          'Preheat oven to 375°F.',
          'In a large mixing bowl, cream together butter and sugar.',
          'Beat in eggs, one at a time.',
          'Gradually add in flour, mixing until just combined.',
          'Stir in chocolate chips.',
          'Drop spoonfuls of dough onto a lined baking sheet.',
          'Bake for 8-10 minutes or until golden brown.',
        ]),
        Recipe(
        name: 'chocolate chip cookies',
        ingredients: 'chocolate, biscuit, milk powder ',
        imageUrl:
             'assets/c.jpg',
        steps: [
          'Preheat oven to 425°F.',
          'Roll out pizza dough on a floured surface.',
          'Spread tomato sauce over dough, leaving a small border.',
          'Add cheese and toppings of your choice.',
          'Bake for 15-20 minutes or until crust is golden brown.',
        ]),
        
        
        Recipe(
        name: 'chicken Fry',
        ingredients: 'Flour, Tomato Sauce, Cheese, Toppings',
        imageUrl:
            'assets/f.jpg',
        steps: [
          'Preheat oven to 425°F.',
          'Roll out pizza dough on a floured surface.',
          'Spread tomato sauce over dough, leaving a small border.',
          'Add cheese and toppings of your choice.',
          'Bake for 15-20 minutes or until crust is golden brown.',
        ]),
  ];
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      children: _recipes.map((recipe) {
        return Card(
           child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailScreen(recipe: recipe),
                ),
              );
            },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(recipe.imageUrl),
              Text(recipe.name, style: Theme.of(context).textTheme.headline6),
              Text(recipe.ingredients),
            ],
          ),
        )
        );
      }).toList(),
    );
  }
}
