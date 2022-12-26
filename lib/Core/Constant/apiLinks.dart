class AppLinks {
  static const serverLink = 'https://jostore2000.000webhostapp.com';
  static const authLink = '$serverLink/auth';
  static const testLink = '$serverLink/test.php';
  static const forgetpasswordLink = '$serverLink/forgetPassword'; 

  //auth
  static const signUpLink = '$authLink/signUp.php';
  static const vertifayLink = '$authLink/vertifaycode.php';
  static const loginLink = '$authLink/login.php';
  static const checkEmailLink = '$forgetpasswordLink/checkemail.php';
  static const vertifayPasswordLink = '$forgetpasswordLink/vertifaycodeForgetpassword.php';
  static const resetPasswordLink = '$forgetpasswordLink/resetpassword.php';
}
