import './shopping_item.dart';

class GroceryList {

  String name;
  List<ShoppingItem> shoppingItems;

  GroceryList({this.name, this.shoppingItems});

  int getDoneShoppingItemsInPercent(){
    int sizeOfDoneShoppingItems = 0;
    for(ShoppingItem shoppingItem in shoppingItems){
      if(shoppingItem.done){
        sizeOfDoneShoppingItems++;
      }
    }

    return (100 / shoppingItems.length * sizeOfDoneShoppingItems).toInt();
  }
}