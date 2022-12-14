import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/Core/Middleware/Meddelware.dart';
import 'package:ecommerce/MainPage.dart';
import 'package:ecommerce/view/Screens/Cart/Cart.dart';
import 'package:ecommerce/view/Screens/Chat/Chat.dart';
import 'package:ecommerce/view/Screens/Detailes/Detailes.dart';
import 'package:ecommerce/view/Screens/Favourite/Favourite.dart';
import 'package:ecommerce/view/Screens/Home/HomePage.dart';
import 'package:ecommerce/view/Screens/OnBoarding/onBoardingPage.dart';
import 'package:ecommerce/view/Screens/Profile/Profile.dart';
import 'package:ecommerce/view/Screens/Profile/Settings/SettingsPage.dart';
import 'package:ecommerce/view/Screens/auth/ForgetPassword/ForgotPassword.dart';
import 'package:ecommerce/view/Screens/auth/ForgetPassword/ResetPassword.dart';
import 'package:ecommerce/view/Screens/auth/ForgetPassword/Vertification.dart';
import 'package:ecommerce/view/Screens/auth/LoginSuccess/LoginSuccess.dart';
import 'package:ecommerce/view/Screens/auth/LoginSuccess/SignUpScuccess.dart';
import 'package:ecommerce/view/Screens/auth/SignUp/CompleteProfile.dart';
import 'package:ecommerce/view/Screens/auth/SignUp/OTPVerification.dart';
import 'package:ecommerce/view/Screens/auth/SignIn/SignIn.dart';
import 'package:ecommerce/view/Screens/auth/SignUp/SignUp.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: AppRoute.onBording,
      page: () => OnBording(),
      middlewares: [MiddleWare()],
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 700)),
//Auth
  GetPage(
      name: AppRoute.signIn,
      page: () => SignIn(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: AppRoute.signUp,
      page: () => SignUp(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: AppRoute.forgetPassword,
      page: () => ForgotPassword(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: AppRoute.signUpValidate,
      page: () => CompleteProfile(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: AppRoute.signUpOtp,
      page: () => OTPVerification(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: AppRoute.loginSuccess,
      page: () => const LoginSuccess(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: AppRoute.verificationPage,
      page: () => VertificationScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: AppRoute.resetPasswordPage,
      page: () => ResetPasswordPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: AppRoute.signUpSuccess,
      page: () => const SignUpSuccess(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 700)),
//main
  GetPage(
      name: AppRoute.mainPage,
      page: () => MainPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: AppRoute.home,
      page: () => HomePage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 700)),
      GetPage(
      name: AppRoute.favorite,
      page: () =>const FavouritePage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 700)),
      GetPage(
      name: AppRoute.chat,
      page: () =>const ChatPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 700)),
      GetPage(
      name: AppRoute.profile,
      page: () =>const ProfilePage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 700)),
      //Details
      GetPage(
      name: AppRoute.details,
      page: () => ProductsDetailes(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 700)),
      //cart
      GetPage(
      name: AppRoute.cart,
      page: () =>const Cart(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 700)),
      GetPage(
      name: AppRoute.settings,
      page: () =>const SettingsPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 700)),
];
