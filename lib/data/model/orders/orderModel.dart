class OrdersModel {
  String? ordersId;
  String? ordersUsersid;
  String? ordersAddressid;
  String? ordersPaymentType;
  String? orderType;
  String? ordersPrice;
  String? ordersStatus;
  String? ordersDateTime;

  OrdersModel(
      {this.ordersId,
      this.ordersUsersid,
      this.ordersAddressid,
      this.ordersPaymentType,
      this.orderType,
      this.ordersPrice,
      this.ordersStatus,
      this.ordersDateTime});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersAddressid = json['orders_addressid'];
    ordersPaymentType = json['orders_paymentType'];
    orderType = json['orders_Type'];
    ordersPrice = json['orders_price'];
    ordersStatus = json['orders_status'];
    ordersDateTime = json['orders_dateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_usersid'] = this.ordersUsersid;
    data['orders_addressid'] = this.ordersAddressid;
    data['orders_paymentType'] = this.ordersPaymentType;
    data['orders_Type'] = this.orderType;
    data['orders_price'] = this.ordersPrice;
    data['orders_status'] = this.ordersStatus;
    data['orders_dateTime'] = this.ordersDateTime;
    return data;
  }
}
