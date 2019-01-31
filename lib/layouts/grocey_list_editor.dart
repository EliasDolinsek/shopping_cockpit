import 'package:flutter/material.dart';

import '../core/grocery_list.dart';
import '../core/shopping_item.dart';

import '../layouts/shopping_items_list.dart';

class GroceyListEditor extends StatefulWidget {
  final GroceryList groceyList;

  GroceyListEditor(this.groceyList);

  @override
  State<StatefulWidget> createState() {
    return _GroceryListEditorState();
  }
}

class _GroceryListEditorState extends State<GroceyListEditor>{

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              child: TextField(
                controller: TextEditingController.fromValue(
                  TextEditingValue(
                    text: widget.groceyList.name,
                    selection: TextSelection(
                        baseOffset: widget.groceyList.name.length,
                        extentOffset: widget.groceyList.name.length),
                  ),
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Grocery List Name",
                ),
                onChanged: (String name) {
                  if (name.trim().isEmpty) {
                    widget.groceyList.name = "unknown";
                  } else {
                    widget.groceyList.name = name;
                  }
                },
              ),
            )),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 16),
          child: ShoppingItemsList(widget.groceyList),
        ),
        RaisedButton(
          color: Theme.of(context).primaryColor,
          child: Text(
            "Add shopping item",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            setState(() {
              widget.groceyList.shoppingItems.add(ShoppingItem());
            });
          },
        )
      ],
    );
  }
}
