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
    return ListView.separated(
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return ShoppingItemUi(
            widget.groceryList.shoppingItems.elementAt(index));
      },
      separatorBuilder: (BuildContext context, int index) => Padding(padding: EdgeInsets.only(left: 8, right: 8), child: Divider(),)
    );
  }
}
