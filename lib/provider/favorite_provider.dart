import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tst_ecommerce/models/products_page.dart';

class FavoriteProvider extends ChangeNotifier{
  final List<ProductsPage> _favorites =[];
  List<ProductsPage> get favorite => _favorites;

  void toggleFavorite(ProductsPage myproduct){
    if(_favorites.contains(myproduct)){
      _favorites.remove(myproduct);
    }else{
      _favorites.add(myproduct);
    }
    notifyListeners();
  }
  bool isExist(ProductsPage myproduct){
    final isExist = _favorites.contains(myproduct);
    return isExist;
  }
  static FavoriteProvider of(
      BuildContext context,{
        bool listen = true,
  }){
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}