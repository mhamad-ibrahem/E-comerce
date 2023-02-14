
class CartModel {
    CartModel({
          this.itemPrice,
          this.countItems,
          this.cartId,
          this.cartUserId,
          this.cartItemId,
          this.itemId,
          this.itemName,
          this.itemNameAr,
          this.itemDescriprion,
          this.itemDescreptionAr,
          this.cartModelItemPrice,
          this.itemImage,
          this.itemCount,
          this.itemActive,
          this.itemDiscount,
          this.itemDate,
          this.itemQuantity,
          this.itemCategories,
          this.itemRate,
          this.item_Price,
    });

    String? itemPrice;
    String? countItems;
    String? cartId;
    String? cartUserId;
    String? cartItemId;
    String? itemId;
    String? itemName;
    String? itemNameAr;
    String? itemDescriprion;
    String? itemDescreptionAr;
    String? cartModelItemPrice;
    String? itemImage;
    String? itemCount;
    String? itemActive;
    String? itemDiscount;
    DateTime? itemDate;
    String? itemQuantity;
    String? itemCategories;
    String? itemRate;
    String? item_Price;

    factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        itemPrice: json["itemPrice"],
        countItems: json["countItems"],
        cartId: json["cart_id"],
        cartUserId: json["cart_userId"],
        cartItemId: json["cart_itemId"],
        itemId: json["item_id"],
        itemName: json["item_name"],
        itemNameAr: json["item_name_ar"],
        itemDescriprion: json["item_descriprion"],
        itemDescreptionAr: json["item_descreption_ar"],
        cartModelItemPrice: json["item_price"],
        itemImage: json["item_image"],
        itemCount: json["item_count"],
        itemActive: json["item_active"],
        itemDiscount: json["item_discount"],
        itemDate: DateTime.parse(json["item_date"]),
        itemQuantity: json["item_quantity"],
        itemCategories: json["item_categories"],
        itemRate: json["item_rate"],
        item_Price: json["item_price"],
    );

    Map<String, dynamic> toJson() => {
        "itemPrice": itemPrice,
        "countItems": countItems,
        "cart_id": cartId,
        "cart_userId": cartUserId,
        "cart_itemId": cartItemId,
        "item_id": itemId,
        "item_name": itemName,
        "item_name_ar": itemNameAr,
        "item_descriprion": itemDescriprion,
        "item_descreption_ar": itemDescreptionAr,
        "item_price": cartModelItemPrice,
        "item_image": itemImage,
        "item_count": itemCount,
        "item_active": itemActive,
        "item_discount": itemDiscount,
        "item_date": itemDate!.toIso8601String(),
        "item_quantity": itemQuantity,
        "item_categories": itemCategories,
        "item_rate": itemRate,
        "item_price":item_Price
    };
}
