import 'package:catalog/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter/material.dart';

import 'package:catalog/models/catalog.dart';

import 'package:catalog/widgets/themes.dart';

import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({required Key key, required this.catalog}) 
  : assert(catalog!=null),
  super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
          "\$${catalog.price}".text.bold.xl4.red800.make(),

          AddToCart(
            key: ValueKey(catalog.id),
            catalog: catalog,
            ).wh(128, 50)

            ],
            ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero
            (tag: Key(catalog.id.toString()),
            child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                children: [
                catalog.name.text.xl4.color(MyTheme.darkBluishColor).bold.make(),
                catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                10.heightBox,
                "Laboris tempor minim irure incididunt. Consequat quis qui officia aliquip. Reprehenderit non culpa fugiat magna consequat non nostrud dolore adipisicing excepteur nulla."
                .text.textStyle(context.captionStyle).make().p16()
                ],
                ).py64(),
                ),
              )
            )
            ],
        )
      ),
    );
  }
}