class EndPoints {
  static const String baserUrl = "http://10.0.2.2:8080/api/";

  static const String products = "products";
  static const String productsSeller = "products/seller";
  static const String orders = "orders/user";
  static const String createOrder = "orders";
  static const String sellerUrl = "sellers";

  static const String loginUser = "v1/auth/authenticate";
  static const String sellersignup = "sellers";
  static const String addtocart = "cart-items";
  static const String getCartItems = "cart-items";
  static const String clearCart = "cart-items/clearAll";
  static const String addProduct = "products/seller";
  static const String getAllcatecgory = "categories";
  static String getSellerProfile(int id) => "sellers/$id";
  static const String userProfile = "profile";
  static const String getOrdersForseller = "order-items/seller";
  static String updateOrderItemStatus(int orderItemId) =>
      "order-items/$orderItemId/status";

  static String getCouponByCode(String code) => "coupons/code/$code";
  static String getProductByCategoryId(int id) => "categories/${id}/products";
  static const String validateCoupon = "coupons/validate";
}
