import 'package:flutter/material.dart';

import '../core/shopping_item.dart';

class ShoppingItemUi extends StatelessWidget {

  final ShoppingItem shoppingItem;
  final Function onDeleteRequest;

  ShoppingItemUi(this.shoppingItem, this.onDeleteRequest);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(),
          child: Container(
            child: Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    controller: TextEditingController.fromValue(
                      TextEditingValue(
                        text: shoppingItem.name,
                        selection: TextSelection(
                            baseOffset: shoppingItem.name.length,
                            extentOffset: shoppingItem.name.length),
                      ),
                    ),
                    decoration: InputDecoration(
                        labelText: "Shopping Item Name",
                        border: OutlineInputBorder()),
                    onChanged: (String newName) {
                      if (newName.trim().isEmpty) {
                        shoppingItem.name = "unknown";
                      } else {
                        shoppingItem.name = newName;
                      }
                    },
                  ),
                ),
                MaterialButton(
                  child: Text("Delete"),
                  onPressed: () {
                    onDeleteRequest();
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
