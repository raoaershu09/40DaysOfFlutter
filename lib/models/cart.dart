import 'package:catalog/models/catalog.dart';

class CartModel {
  CatalogModel? _catalog;
  final List<int> _itemIds = [];

  // Setter for the catalog
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  // Getter for items in the cart
  List<Item> get items {
    return _itemIds.map((id) => _catalog!.getById(id)).toList();
  }

// get total price

num get totalprice => items.fold(0, (total, curent) => total + curent.price);

// Add item

void add(Item item) {
  _itemIds.add(item.id);
}

// Remove item

void remove(Item item) {
  _itemIds.remove(item.id);
}

}
