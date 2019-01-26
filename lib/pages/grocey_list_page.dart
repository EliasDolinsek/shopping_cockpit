import 'package:flutter/material.dart';
import '../layouts/grocery_list_layout.dart';

import '../pages/grocey_list_editor_page.dart';

import '../core/grocery_list.dart';
import '../core/database.dart';
import '../core/shopping_item.dart';

class GroceyListPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "ShoppingCockpit",
              style: TextStyle(fontFamily: "Courgette-Regular"),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 8),
          child: GroceryListLayout(Database(grocerysLists: [
            GroceryList(name: "Wocheneinkauf", shoppingItems: [
              ShoppingItem(name: "Wocheneinkauf", done: false)
            ]),
            GroceryList(
                name: "Grillparty",
                shoppingItems: [ShoppingItem(name: "Grillparty", done: true)])
          ])),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GroceyListEditorPage()));
          },
          child: Icon(Icons.add),
        ),
      );
  }
}