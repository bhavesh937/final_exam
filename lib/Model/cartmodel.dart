class CartModel {
  final String? img;
  final String? name;
  final int? price;
  final String? dis;
  final String? star;
  final String? Kcal;
  final String? min;
  final int? qty;

  CartModel(
      {required this.img,
      required this.name,
      required this.price,
      required this.dis,
      required this.star,
      required this.Kcal,
      required this.qty,
      required this.min});
}

List<CartModel> cartList = [];
