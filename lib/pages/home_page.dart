
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'dart:convert';

import 'package:catalog/models/catalog.dart';

import 'package:catalog/widgets/home_widgets/catalog_header.dart';

import 'package:catalog/widgets/home_widgets/catalog_list.dart';

import 'package:catalog/widgets/themes.dart'; 

import 'package:velocity_x/velocity_x.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
final int days = 30;

final String name = "Codepur";


@override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async{
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {
      
    });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      floatingActionButton: FloatingActionButton(
      onPressed: () {},
      backgroundColor: MyTheme.darkBluishColor,
      foregroundColor: Colors.white,
      child: const Icon(CupertinoIcons.cart),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
              CatalogList().py16().expand()
              else
                const CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
      );
  }
}
