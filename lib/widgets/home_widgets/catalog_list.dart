import 'package:catalog/models/cart.dart';

import 'package:flutter/material.dart';

import 'package:catalog/models/catalog.dart';

import 'package:catalog/pages/home_detail_page.dart';

import 'package:catalog/widgets/home_widgets/catalog_image.dart';
 
import 'package:catalog/widgets/themes.dart';

import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeDetailPage(
              catalog: catalog,
              key: ValueKey(catalog.id),
              
              )
            )
          ),
          child: CatalogItem(
            key: ValueKey(catalog.id),
            catalog: catalog,
          ),
        );
      },
    );
  }
}


class CatalogItem extends StatelessWidget {
final Item catalog;

const CatalogItem({required Key key, required this.catalog})
: assert(catalog!=null),
super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage( 
              image: catalog.image, 
              key: ValueKey(catalog.image),
              ),
          ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
                  catalog.desc.text.textStyle(context.captionStyle).make(),
                  10.heightBox, 
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      "\$${catalog.price}".text.bold.xl.make(),                   _AddToCart(catalog : catalog, key: ValueKey(catalog.id))
                    ],
                  ).pOnly(right: 8.0)
                ],
              )
              )
        ], 
      ),
    ).white.rounded.square(150).make().py16();
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog;
  const _AddToCart({
    required Key key, required this.catalog,
    }) :super(key: key);

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
    bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:() {
        isAdded = isAdded.toggle();
        final _catalog = CatalogModel();
        final _cart = CartModel();
        _cart.catalog = CatalogModel();
        _cart.add(widget.catalog);
        setState(() {});
      },
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(
        MyTheme.darkBluishColor,
      ),
      shape: WidgetStateProperty.all(
        const StadiumBorder(),
      )
    ),
     child: isAdded ? Icon(Icons.done) : "Add to cart".text.white.make(), 
     );
  }
}