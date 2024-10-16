class CatalogModel {
  static List<Item> items = [
    Item(
       id: 1, 
       name: "iPhone 12 Pro",
       desc: "Apple iPhone 12th generation",
       price: 999,
       color: "#33505a",
       image: "https://regen.pk/cdn/shop/products/iphone-12-pro-321394_ee217b80-7d48-48ea-bae8-710b41bca458.jpg?v=1674907301")
  ];
}

class Item {
  late final int id;
  late final String name;
  late final String desc;
  late final num price;
  late final String color;
  late final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

      factory Item.fromMap(Map<String, dynamic> map){
        return Item(
          id: map["id"],
          name: map["name"],
          desc: map["desc"],
          price: map["price"],
          color: map["color"],
          image: map["image"],
        );
      }

      toMap() => {
          "id": id,
          "name": name,
          "desc": desc,
          "price": price,
          "color": color,
          "image": image,
      };
}