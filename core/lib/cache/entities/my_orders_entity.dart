class MyOrdersEntity {
  final int id;
  final double totalAmount;
  final double shippingPrice;
  final String pickAddress;
  final String deliveringAddress;
  final String createdAt;
  final String UpdatedAt;
  final String shipmentId;
  final int orderStatusId;
  final String paymentStatus;
  final String storeName;
  final int shipmentCount;
  final double Longitude;
  final double Latitude;
  final String MerchantPhone;
  final int timeAgo;
  final String? statusName;
  final String? Color;
  MyOrdersEntity(
      {required this.totalAmount,
      required this.pickAddress,
      required this.deliveringAddress,
      required this.id,
      required this.shippingPrice,
      required this.createdAt,
      required this.UpdatedAt,
      required this.shipmentId,
      required this.orderStatusId,
      required this.paymentStatus,
      required this.storeName,
      required this.Longitude,
      required this.Latitude,
      required this.MerchantPhone,
      required this.timeAgo,
      required this.shipmentCount,
      required this.Color,
      this.statusName});
}
