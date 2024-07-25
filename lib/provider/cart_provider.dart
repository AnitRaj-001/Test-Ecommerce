import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tst_ecommerce/models/products_page.dart';


class CartProvider extends ChangeNotifier{
  final List<ProductsPage> _Cart = [];
  List<ProductsPage> get cart => _Cart;

  void toggleProduct (ProductsPage myProduct){
    if(_Cart.contains(myProduct)){
for( ProductsPage elements in _Cart){
  elements.quantity++;
}
  }else{
      _Cart.add(myProduct);
    }
    notifyListeners();
  }
  incrementQuantity(int index) => _Cart[index].quantity++;
  decrementQuantity(int index) => _Cart[index].quantity--;
  getTotalPrice() {
    double total = 0.0;
    for(ProductsPage element in _Cart){
      total += element.price * element.quantity;
    }
    return total;
  }

  static CartProvider of(BuildContext context,{
    bool listen  =true,
  }){
    return Provider.of<CartProvider>(
      context,
      listen: listen,
    );
  }

}