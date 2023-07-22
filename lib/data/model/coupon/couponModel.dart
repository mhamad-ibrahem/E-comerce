import 'dart:convert';

CouponModel couponModelFromJson(String str) =>
    CouponModel.fromJson(json.decode(str));

String couponModelToJson(CouponModel data) => json.encode(data.toJson());

class CouponModel {
  CouponModel({
    required this.couponId,
    required this.couponName,
    required this.couponCount,
    required this.couponDiscount,
    required this.couponExpiredate,
  });

  String couponId;
  String couponName;
  String couponCount;
  String couponDiscount;
  DateTime couponExpiredate;

  factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
        couponId: json["coupon_id"],
        couponName: json["coupon_name"],
        couponCount: json["coupon_count"],
        couponDiscount: json["coupon_discount"],
        couponExpiredate: DateTime.parse(json["coupon_expiredate"]),
      );

  Map<String, dynamic> toJson() => {
        "coupon_id": couponId,
        "coupon_name": couponName,
        "coupon_count": couponCount,
        "coupon_discount": couponDiscount,
        "coupon_expiredate": couponExpiredate.toIso8601String(),
      };
}
