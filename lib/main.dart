import 'package:flutter/material.dart';

import './pages/grocey_list_page.dart';

void main() {
  runApp(ShoppingCockpit());
}

class ShoppingCockpit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: GroceyListPage()
    );
  }
}
