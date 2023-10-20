import 'package:flutter/material.dart';
import 'package:lumi_ecommerce/model/cart_model.dart';

class myProvider with ChangeNotifier{
  int current_index=1;
  List<CartModel> list=[];

void increment(){
  current_index++;
  notifyListeners();
}

void decrement(){
  current_index--;
   notifyListeners();
}

  void addCart(CartModel newCart)
{
  bool isDuplicate=list.any((existingItem) =>existingItem.productTitle==newCart.productTitle );
  if(isDuplicate){
    CartModel existingItem=list.firstWhere((existingItem) => existingItem.productTitle==newCart.productTitle);

existingItem.productQuantity++;
  }
  else{

 list.add(newCart);
  notifyListeners();
  }
  
 
}

 deleteCart(int index){
  list.removeAt(index);
  notifyListeners();
}


}