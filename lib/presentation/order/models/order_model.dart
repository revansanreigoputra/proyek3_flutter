class OrderModel {
  final String ticket;
  final String date;
  final String destination;
  final String price;
  final String status;
  List<VoucherModel> voucher;

  OrderModel(
      {required this.ticket,
      required this.date,
      required this.destination,
      required this.price,
      required this.status,
      required this.voucher});
}

class VoucherModel {
  final String number;
  final String description;
  final String qrCode;

  VoucherModel({
    required this.number,
    required this.description,
    required this.qrCode,
  });
}
