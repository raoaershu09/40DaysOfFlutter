import 'package:flutter/material.dart';

import 'package:catalog/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  
  final Item item;

const ItemWidget({
    required Key key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print("${item.name} pressed");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}",
        textScaleFactor: 1.5,
        style: const TextStyle(
          color: Colors.deepPurple,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
    );
  }
}