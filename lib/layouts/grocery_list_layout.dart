import 'package:flutter/material.dart';

import '../core/database.dart';
import '../uis/grocery_item_ui.dart';

class GroceryListLayout extends StatefulWidget {
  final Database database;

  GroceryListLayout(this.database);

  @override
  State<StatefulWidget> createState() {
    return _GroceryListLayoutState();
  }
}

class _GroceryListLayoutState extends State<GroceryListLayout> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Divider(),
          ),
      itemCount: widget.database.grocerysLists.length,
      itemBuilder: (BuildContext context, int index) {
        return GroceryItemUI(widget.database.grocerysLists.elementAt(index), (){
          setState(() {
            widget.database.grocerysLists.removeAt(index);
          });
        });
      },
    );
}
}