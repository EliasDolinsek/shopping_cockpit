import 'package:flutter/material.dart';

import '../core/grocery_list.dart';
import '../layouts/shopping_items_list.dart';

class GroceyListEditor extends StatelessWidget {

  final GroceryList groceyList;

  GroceyListEditor(this.groceyList);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16),
          child: TextField(
            controller: TextEditingController.fromValue(TextEditingValue(text: groceyList.name, selection: TextSelection(baseOffset: groceyList.name.length, extentOffset: groceyList.name.length),),),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name",
            ),
            onChanged: (String name) {
              if (name.trim().isEmpty) {
                groceyList.name = "unknown";
              } else {
                groceyList.name = name;
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: ShoppingItemsList(groceyList),
        )
      ],
    );
  }
}
