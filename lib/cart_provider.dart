import 'package:flutter/cupertino.dart';
//here CartProvider can be used at any place in entire app
class CartProvider extends ChangeNotifier{
  final List<Map<String, dynamic>> cart =[];
  void addProuct(Map<String, dynamic> product){
    cart.add(product);
    notifyListeners();
  }
  void removeProduct(Map<String, dynamic> product){
    cart.remove(product);
    notifyListeners();
  }


}
