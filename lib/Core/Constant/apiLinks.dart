class AppLinks {

  // ===============Links ==============
  static const serverLink = 'https://jostore2000.000webhostapp.com';
  static const authLink = '$serverLink/auth';
  static const testLink = '$serverLink/test.php';
  static const forgetpasswordLink = '$serverLink/forgetPassword'; 
  static const imageStaticLink = "https://jostore2000.000webhostapp.com/upload";
  //==================  Images  =================
  static const categoriesImageLink = "$imageStaticLink/categories";
  static const itemsImageLink = "$imageStaticLink/items";
  //===========================================
  //=================   Auth    ====================
  static const signUpLink = '$authLink/signUp.php';
  static const vertifayLink = '$authLink/vertifaycode.php';
  static const loginLink = '$authLink/login.php';
  static const checkEmailLink = '$forgetpasswordLink/checkemail.php';
  static const vertifayPasswordLink = '$forgetpasswordLink/vertifaycodeForgetpassword.php';
  static const resetPasswordLink = '$forgetpasswordLink/resetpassword.php';
  static const resendCodeLink = '$authLink/resindCode.php';

  //====================  Home Page  ==================
  static const homeLink = "$serverLink/home.php";

  // =================== Items ======================
  static const itemsLink = "$serverLink/items/items.php";
  // ============== Favorite  ==================
  static const addTofavorite = "$serverLink/favorite/addToFavorite.php";
  static const removeFromfavorite = "$serverLink/favorite/removeFromfavorite.php";
}
