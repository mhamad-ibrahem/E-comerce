class ItemsModel {
  String? itemId;
  String? itemName;
  String? itemNameAr;
  String? itemDescriprion;
  String? itemDescreptionAr;
  String? itemPrice;
  String? itemImage;
  String? itemCount;
  String? itemActive;
  String? itemDiscount;
  String? itemDate;
  String? itemQuantity;
  String? itemCategories;
  String? itemRate;
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDateTime;
  String? isFavorite;
  String? itemfinalPrice;

  ItemsModel(
      {this.itemId,
      this.itemName,
      this.itemNameAr,
      this.itemDescriprion,
      this.itemDescreptionAr,
      this.itemPrice,
      this.itemImage,
      this.itemCount,
      this.itemActive,
      this.itemDiscount,
      this.itemDate,
      this.itemQuantity,
      this.itemCategories,
      this.itemRate,
      this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesImage,
      this.categoriesDateTime,
      this.isFavorite,
      this.itemfinalPrice
      });

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemNameAr = json['item_name_ar'];
    itemDescriprion = json['item_descriprion'];
    itemDescreptionAr = json['item_descreption_ar'];
    itemPrice = json['item_price'];
    itemImage = json['item_image'];
    itemCount = json['item_count'];
    itemActive = json['item_active'];
    itemDiscount = json['item_discount'];
    itemDate = json['item_date'];
    itemQuantity = json['item_quantity'];
    itemCategories = json['item_categories'];
    itemRate = json['item_rate'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDateTime = json['categories_dateTime'];
    isFavorite = json["favorite"];
    itemfinalPrice= json["itemFinalPrice"]??'0';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = itemId;
    data['item_name'] = itemName;
    data['item_name_ar'] = itemNameAr;
    data['item_descriprion'] = itemDescriprion;
    data['item_descreption_ar'] = itemDescreptionAr;
    data['item_price'] = itemPrice;
    data['item_image'] = itemImage;
    data['item_count'] = itemCount;
    data['item_active'] = itemActive;
    data['item_discount'] = itemDiscount;
    data['item_date'] = itemDate;
    data['item_quantity'] = itemQuantity;
    data['item_categories'] = itemCategories;
    data['item_rate'] = itemRate;
    data['categories_id'] = categoriesId;
    data['categories_name'] = categoriesName;
    data['categories_name_ar'] = categoriesNameAr;
    data['categories_image'] = categoriesImage;
    data['categories_dateTime'] = categoriesDateTime;
    data["favorite"]=isFavorite;
    data["itemFinalPrice"] =itemfinalPrice;
    return data;
  }
}