class HistoryModel {
  final String day;
  final double amount;
  final String place;
  final List<Item> items;

  HistoryModel({this.day, this.amount, this.place, this.items});
}

class Item {
  final String name;
  final double price;

  Item({this.name, this.price});
}
