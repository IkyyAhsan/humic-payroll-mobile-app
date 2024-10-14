import 'package:get/get.dart';

import '../modules/add_expenses_screen/bindings/add_expenses_screen_binding.dart';
import '../modules/add_expenses_screen/views/add_expenses_screen_view.dart';
import '../modules/add_income_screen/bindings/add_income_screen_binding.dart';
import '../modules/add_income_screen/views/add_income_screen_view.dart';
import '../modules/approval_screen/bindings/approval_screen_binding.dart';
import '../modules/approval_screen/views/approval_screen_view.dart';
import '../modules/bottom_navigation_bar/bindings/bottom_navigation_bar_binding.dart';
import '../modules/bottom_navigation_bar/views/bottom_navigation_bar_view.dart';
import '../modules/expenses_screen/bindings/expenses_screen_binding.dart';
import '../modules/expenses_screen/views/expenses_screen_view.dart';
import '../modules/export_screen/bindings/export_screen_binding.dart';
import '../modules/export_screen/views/export_screen_view.dart';
import '../modules/filter_screen/bindings/filter_screen_binding.dart';
import '../modules/filter_screen/views/filter_screen_view.dart';
import '../modules/home_screen/bindings/home_screen_binding.dart';
import '../modules/home_screen/views/home_screen_view.dart';
import '../modules/income_screen/bindings/income_screen_binding.dart';
import '../modules/income_screen/views/income_screen_view.dart';
import '../modules/login_screen/bindings/login_screen_binding.dart';
import '../modules/login_screen/views/login_screen_view.dart';
import '../modules/more_screen/bindings/more_screen_binding.dart';
import '../modules/more_screen/views/more_screen_view.dart';
import '../modules/profile_screen/bindings/profile_screen_binding.dart';
import '../modules/profile_screen/views/profile_screen_view.dart';
import '../modules/register_screen/bindings/register_screen_binding.dart';
import '../modules/register_screen/views/register_screen_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/transaction_details_screen/bindings/transaction_details_screen_binding.dart';
import '../modules/transaction_details_screen/views/transaction_details_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MORE_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME_SCREEN,
      page: () => const HomeScreenView(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => const LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_SCREEN,
      page: () => const RegisterScreenView(),
      binding: RegisterScreenBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAVIGATION_BAR,
      page: () => const BottomNavigationBarView(),
      binding: BottomNavigationBarBinding(),
    ),
    GetPage(
      name: _Paths.INCOME_SCREEN,
      page: () => const IncomeScreenView(),
      binding: IncomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.EXPENSES_SCREEN,
      page: () => const ExpensesScreenView(),
      binding: ExpensesScreenBinding(),
    ),
    GetPage(
      name: _Paths.MORE_SCREEN,
      page: () => const MoreScreenView(),
      binding: MoreScreenBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.EXPORT_SCREEN,
      page: () => const ExportScreenView(),
      binding: ExportScreenBinding(),
    ),
    GetPage(
      name: _Paths.APPROVAL_SCREEN,
      page: () => const ApprovalScreenView(),
      binding: ApprovalScreenBinding(),
    ),
    GetPage(
      name: _Paths.TRANSACTION_DETAILS_SCREEN,
      page: () => const TransactionDetailsScreenView(),
      binding: TransactionDetailsScreenBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_SCREEN,
      page: () => const ProfileScreenView(),
      binding: ProfileScreenBinding(),
    ),
    GetPage(
      name: _Paths.FILTER_SCREEN,
      page: () => const FilterScreenView(),
      binding: FilterScreenBinding(),
    ),
    GetPage(
      name: _Paths.ADD_INCOME_SCREEN,
      page: () => const AddIncomeScreenView(),
      binding: AddIncomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.ADD_EXPENSES_SCREEN,
      page: () => const AddExpensesScreenView(),
      binding: AddExpensesScreenBinding(),
    ),
  ];
}
