import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/Core/Middleware/Meddelware.dart';
import 'package:ecommerce/MainPage.dart';
import 'package:ecommerce/view/Screens/Cart/Cart.dart';
import 'package:ecommerce/view/Screens/Categories/CategoriesScreen.dart';
import 'package:ecommerce/view/Screens/Chat/Chat.dart';
import 'package:ecommerce/view/Screens/Detailes/Detailes.dart';
import 'package:ecommerce/view/Screens/Favourite/Favourite.dart';
import 'package:ecommerce/view/Screens/Home/HomePage.dart';
import 'package:ecommerce/view/Screens/OnBoarding/onBoardingPage.dart';
import 'package:ecommerce/view/Screens/Profile/Profile.dart';
import 'package:ecommerce/view/Screens/Profile/ProfileChildren/Account/accountScreen.dart';
import 'package:ecommerce/view/Screens/Profile/ProfileChildren/HelpCenter/HelpCenterScreen.dart';
import 'package:ecommerce/view/Screens/Profile/ProfileChildren/Notification/NotificationScreen.dart';
import 'package:ecommerce/view/Screens/Profile/ProfileChildren/Settings/SettingsPage.dart';
import 'package:ecommerce/view/Screens/auth/ForgetPassword/ForgotPassword.dart';
import 'package:ecommerce/view/Screens/auth/ForgetPassword/ResetPassword.dart';
import 'package:ecommerce/view/Screens/auth/ForgetPassword/Vertification.dart';
import 'package:ecommerce/view/Screens/auth/LoginSuccess/LoginSuccess.dart';
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
      page: () =>const SignIn(),
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
      page: () =>const VertificationScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: AppRoute.resetPasswordPage,
      page: () => ResetPasswordPage(),
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
      page: () => const HomePage(),
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
      page: () => Cart(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 700)),
      GetPage(
      name: AppRoute.settings,
      page: () =>const SettingsPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 700)),
      //categories
        GetPage(
      name: AppRoute.categories,
      page: () => const CategoriesScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 700)),
      GetPage(
      name: AppRoute.account,
      page: () => const AccountScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 700)),
      GetPage(
      name: AppRoute.helpCenter,
      page: () => const HelpCenterScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 700)),
      GetPage(
      name: AppRoute.notifications,
      page: () => const NotificationsScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 700)),
];
