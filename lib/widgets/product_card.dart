import 'package:flutter/material.dart';
import 'package:tst_ecommerce/models/products_page.dart';
import 'package:tst_ecommerce/provider/favorite_provider.dart';

class ProductCard extends StatefulWidget{
  final ProductsPage productsPage;
  const ProductCard({super.key, required this.productsPage});

  @override
  State<ProductCard> createState() {
return _ProductCardState();
  }

}
class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {

    final provider =FavoriteProvider.of(context);

    return Container(
      width: MediaQuery.of(context).size.width/2,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color:Colors.grey.withOpacity(0.1),
      ),
      child: Column(
        children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: ()=> provider.toggleFavorite(widget.productsPage),
                  child: Icon(provider.isExist(widget.productsPage)?Icons.favorite :
                    Icons.favorite_border_outlined,color: Colors.red,
                  ),
              )
            ],
          ),
          SizedBox(
            height: 130,
            width: 130,
            child: Image.asset(
              widget.productsPage.image,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            widget.productsPage.name,
            style:const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            widget.productsPage.category,
            style:const TextStyle(
                fontSize: 14,
                color: Colors.red
            ),
          ),
          Text('\ Rs -' '${widget.productsPage.price}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}