class AppLinks {
  // ===============Links ==============
  static const serverLink = 'https://jostore2000.000webhostapp.com';
  static const authLink = '$serverLink/auth';
  static const testLink = '$serverLink/test.php';
  static const forgetpasswordLink = '$serverLink/forgetPassword';
  static const imageStaticLink = "https://jostore2000.000webhostapp.com/upload";
  static const favoriteLink = "$serverLink/favorite";
  static const cartLink = "$serverLink/cart";
  static const ordersLink = "$serverLink/orders";
  static const addressLink = "$serverLink/address";
  //==================  Images  =================
  static const categoriesImageLink = "$imageStaticLink/categories";
  static const itemsImageLink = "$imageStaticLink/items";
  static const profileImagesLink = "$imageStaticLink/usersImages/";
  //===========================================
  //=================   Auth    ====================
  static const signUpLink = '$authLink/signUp.php';
  static const vertifayLink = '$authLink/vertifaycode.php';
  static const loginLink = '$authLink/login.php';
  static const checkEmailLink = '$forgetpasswordLink/checkemail.php';
  static const vertifayPasswordLink =
      '$forgetpasswordLink/vertifaycodeForgetpassword.php';
  static const resetPasswordLink = '$forgetpasswordLink/resetpassword.php';
  static const resendCodeLink = '$authLink/resindCode.php';

  //====================  Home Page  ==================
  static const homeLink = "$serverLink/home.php";

  // =================== Items ======================
  static const itemsLink = "$serverLink/items/items.php";
  // ============== Favorite  ==================
  static const addTofavorite = "$serverLink/favorite/addToFavorite.php";
  static const removeFromfavorite = "$favoriteLink/removeFromFavorite.php";
  static const viewFavoriteData = "$favoriteLink/viewFavorite.php";
  static const deleteFavoriteData = "$favoriteLink/deleteFromFavorite.php";
  static const order = "$searchLink/orders";
  static const notification = "$serverLink/notification";
  // ============== Cart  ==================
  static const viewCartData = "$cartLink/view.php";
  static const removeCartData = "$cartLink/remove.php";
  static const addCartData = "$cartLink/add.php";
  static const getCountItemCartData = "$cartLink/getCountItem.php";
  static const couponLink = "$serverLink/coupon/checkCoupon.php";
  //=============== Orders ========================
  static const addOrder = "$ordersLink/add.php";
  static const getOrders = "$ordersLink/view.php";
  // ========================= search ===============
  static const searchLink = "$serverLink/items/searchItem.php";
  //============== Address =============
  static const addAddressLink = "$addressLink/add.php";
  static const editeAddressLink = "$addressLink/edite.php";
  static const deleteAddressLink = "$addressLink/delete.php";
  static const viewAddressLink = "$addressLink/view.php";
  //==========Notifications
  static const notificationLink = '$notification/notification.php';
  //profile
  static const profileLink = '$serverLink/profile/view.php';
  static const updateProfileLink = '$serverLink/profile/edit.php';
}
