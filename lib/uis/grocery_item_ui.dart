import 'package:flutter/material.dart';

import '../core/grocery_list.dart';
import '../pages/grocey_list_editor_page.dart';

class GroceryItemUI extends StatelessWidget {
  final GroceryList groceryList;
  final Function onDeleteRequest;

  GroceryItemUI(this.groceryList, this.onDeleteRequest);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => GroceyListEditorPage(
                        groceryList: groceryList,
                      )));
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
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                title: Text(
                                    "Do you really want to delete this grocery list?"),
                                content: Text(
                                    "This will delte all shopping items of this list!"),
                                actions: <Widget>[
                                  MaterialButton(
                                    child: Text("Cancel"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  MaterialButton(
                                    child: Text("Delete"),
                                    onPressed: () {
                                      Navigator.pop(context, true);
                                    },
                                  )
                                ],
                              )).then((onValue) {
                        if (onValue) {
                          onDeleteRequest();
                        }
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: ActionChip(
                    label: Text("Continue"),
                    onPressed: () {},
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
