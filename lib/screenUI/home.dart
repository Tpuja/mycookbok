import 'package:my_cook_book/recipe/Recipe.dart';
import 'package:my_cook_book/screenUI/Recipes.dart';
import 'package:my_cook_book/screenUI/add.dart';
import 'package:my_cook_book/screenUI/manage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_cook_book/screenUI/toshop.dart';
import 'package:pandabar/pandabar.dart';

void main(List<String> args) {
  runApp(home());
}

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String page = 'Grey';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Food Book'),
      ),
      extendBody: true,
      bottomNavigationBar: PandaBar(
        buttonData: [
          PandaBarButtonData(
            id: 'recipes',
            icon: Icons.dashboard,
            title: 'Recipes',
          ),
          PandaBarButtonData(id: 'Green', icon: Icons.add, title: 'Add'),
          PandaBarButtonData(
              id: 'To Shop', icon:Icons.notifications, title: 'To Shop'),
          PandaBarButtonData(
              id: 'Yellow', icon: Icons.settings, title: 'Manage'),
        ],
        onChange: (id) {
          setState(() {
            page = id;
          });
        },
        onFabButtonPressed: () {
          showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  content: Text('Fab Button Pressed!'),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: Text('Close'),
                      isDestructiveAction: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                );
              });
        },
      ),
    
      body: Builder(
        builder: (context) {
          
          switch (page) {
            case 'Green':
            return add();
            
            case 'Recipes':
              return RecipeList();

            case 'To Shop':
              return toshop();

            case 'Yellow':
              return Manage();
            
            default:
              return RecipeList();
          }
        },
      ),
    );
  }
}