import 'package:flutter/material.dart';

import '../core/grocery_list.dart';
import '../layouts/grocey_list_editor.dart';

class GroceyListEditorPage extends StatelessWidget{

  final GroceryList groceryList;

  GroceyListEditorPage({this.groceryList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(groceryList.name),
      ),
      body: GroceyListEditor(groceryList),
    );
  }
}