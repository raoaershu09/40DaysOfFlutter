
import 'package:catalog/models/cart.dart';

import 'package:catalog/models/catalog.dart';

import 'package:catalog/widgets/themes.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    required Key key, required this.catalog,
    }) :super(key: key);


  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
      onPressed:() {
        if (!isInCart){
        isInCart = isInCart.toggle();
        final _catalog = CatalogModel();
       
        _cart.catalog = CatalogModel();
        _cart.add(catalog);
       // setState(() {});
        }
      },
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(
        MyTheme.darkBluishColor,
      ),
      shape: WidgetStateProperty.all(
        const StadiumBorder(),
      )
    ),
     child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.calendar_badge_plus), 
     );
  }
}