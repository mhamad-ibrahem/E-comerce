class FavoriteModel {
	String? favoriteId;
	String? favoriteUserId;
	String? favoriteItemsId;
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
	String? userId;

	FavoriteModel({this.favoriteId, this.favoriteUserId, this.favoriteItemsId, this.itemId, this.itemName, this.itemNameAr, this.itemDescriprion, this.itemDescreptionAr, this.itemPrice, this.itemImage, this.itemCount, this.itemActive, this.itemDiscount, this.itemDate, this.itemQuantity, this.itemCategories, this.itemRate, this.userId});

	FavoriteModel.fromJson(Map<String, dynamic> json) {
		favoriteId = json['favorite_id'];
		favoriteUserId = json['favorite_userId'];
		favoriteItemsId = json['favorite_itemsId'];
		itemId = json['item_id'];
		itemName = json['item_name'];
		itemNameAr = json['item_name_ar'];
		itemDescriprion = json['item_descriprion'];
		itemDescreptionAr = json['item_descreption_ar'];
		itemPrice = json['item_price'];
		itemImage = json['item_image']??"https://th.bing.com/th/id/R.1a12b4c6a85c3d3d0356b8b0982e3038?rik=4599%2b8ifPLmWog&pid=ImgRaw&r=0&sres=1&sresct=1";
		itemCount = json['item_count'];
		itemActive = json['item_active'];
		itemDiscount = json['item_discount'];
		itemDate = json['item_date'];
		itemQuantity = json['item_quantity'];
		itemCategories = json['item_categories'];
		itemRate = json['item_rate'];
		userId = json['user_id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = Map<String, dynamic>();
		data['favorite_id'] = favoriteId;
		data['favorite_userId'] = favoriteUserId;
		data['favorite_itemsId'] = favoriteItemsId;
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
		data['user_id'] = userId;
		return data;
	}
}