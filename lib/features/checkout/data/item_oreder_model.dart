class ItemOrderModel {
  final int quantity;
  final int id;
  ItemOrderModel({
    required this.quantity,
    required this.id,
  });
 
 factory ItemOrderModel.fromJson(Map<String, dynamic> json) {
    return ItemOrderModel(
      quantity: json['quantity'],
      id: json['id'],
    );
 }
  Map<String, dynamic> toJson() {
    return {'quantity': quantity, 'productId': id};
  }
}
