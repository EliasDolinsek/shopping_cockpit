import 'package:flutter/material.dart';

import '../core/shopping_item.dart';

class ShoppingItemUi extends StatelessWidget {
  final ShoppingItem shoppingItem;

  ShoppingItemUi(this.shoppingItem);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(),
          child: Container(
            child: TextField(
              controller: TextEditingController.fromValue(TextEditingValue(
                text: shoppingItem.name,
                selection: TextSelection(
                    baseOffset: shoppingItem.name.length,
                    extentOffset: shoppingItem.name.length),
              )),
              decoration: InputDecoration(labelText: "Shopping Item Name"),
              onChanged: (String newName) {
                if (newName.trim().isEmpty) {
                  shoppingItem.name = "unknown";
                } else {
                  shoppingItem.name = newName;
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
