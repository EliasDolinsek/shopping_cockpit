import 'package:flutter/material.dart';

import '../core/grocery_list.dart';
import '../pages/grocey_list_editor_page.dart';

class GroceryItemUI extends StatelessWidget {
  final GroceryList groceryList;

  GroceryItemUI(this.groceryList);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GroceyListEditorPage(groceryList: groceryList,)));
        },
        child: Column(
          children: <Widget>[
            Text(groceryList.name,
                style: TextStyle(fontFamily: "Roboto-Regular", fontSize: 34)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Chip(
                  backgroundColor: Theme.of(context).primaryColor,
                  label: Text(
                    "${groceryList.getDoneShoppingItemsInPercent()}% Done",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: ActionChip(
                    backgroundColor: Colors.redAccent,
                    label: Text(
                      "Delete",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: ActionChip(
                    label: Text("Continue"),
                    onPressed: (){},
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
