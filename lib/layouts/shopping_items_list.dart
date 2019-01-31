import 'package:flutter/material.dart';

import '../core/grocery_list.dart';
import '../uis/shopping_item_ui.dart';

class ShoppingItemsList extends StatefulWidget {
  final GroceryList groceryList;

  ShoppingItemsList(this.groceryList);

  @override
  State<StatefulWidget> createState() {
    return _ShoppingItemsListState();
  }
}

class _ShoppingItemsListState extends State<ShoppingItemsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.groceryList.shoppingItems.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: ShoppingItemUi(
              widget.groceryList.shoppingItems.elementAt(index), () {
            setState(() {
              widget.groceryList.shoppingItems.removeAt(index);
            });
          }),
        );
      },
    );
  }
}
