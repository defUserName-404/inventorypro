class Item {
  int? id;
  String name;
  String description;
  int quantity;

  Item(
      {this.id,
      required this.name,
      required this.description,
      required this.quantity});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'quantity': quantity,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      quantity: map['quantity'],
    );
  }
}
