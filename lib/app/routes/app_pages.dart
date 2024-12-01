import 'package:get/get.dart';

import '../modules/approval_detail_screen/bindings/approval_detail_screen_binding.dart';
import '../modules/approval_detail_screen/views/approval_detail_screen_view.dart';
import '../modules/approval_screen/bindings/approval_screen_binding.dart';
import '../modules/approval_screen/views/approval_screen_view.dart';
import '../modules/bottom_navigation_bar/bindings/bottom_navigation_bar_binding.dart';
import '../modules/bottom_navigation_bar/views/bottom_navigation_bar_view.dart';
import '../modules/compare_details_screen/bindings/compare_details_screen_binding.dart';
import '../modules/compare_details_screen/views/compare_details_screen_view.dart';
import '../modules/compare_screen/bindings/compare_screen_binding.dart';
import '../modules/compare_screen/views/compare_screen_view.dart';
import '../modules/expenses_screen/bindings/expenses_screen_binding.dart';
import '../modules/expenses_screen/views/expenses_screen_view.dart';
import '../modules/export_screen/bindings/export_screen_binding.dart';
import '../modules/export_screen/views/export_screen_view.dart';
import '../modules/filter_screen/bindings/filter_screen_binding.dart';
import '../modules/filter_screen/views/filter_screen_view.dart';
import '../modules/home_screen/bindings/home_screen_binding.dart';
import '../modules/home_screen/controllers/home_screen_controller.dart';
import '../modules/home_screen/views/home_screen_view.dart';
import '../modules/login_screen/bindings/login_screen_binding.dart';
import '../modules/login_screen/views/login_screen_view.dart';
import '../modules/more_screen/bindings/more_screen_binding.dart';
import '../modules/more_screen/views/more_screen_view.dart';
import '../modules/planning_add_screen/bindings/planning_add_screen_binding.dart';
import '../modules/planning_add_screen/views/planning_add_screen_view.dart';
import '../modules/planning_detail_screen/bindings/planning_detail_screen_binding.dart';
import '../modules/planning_detail_screen/views/planning_detail_screen_view.dart';
import '../modules/planning_edit_item_screen/bindings/planning_edit_item_screen_binding.dart';
import '../modules/planning_edit_item_screen/views/planning_edit_item_screen_view.dart';
import '../modules/planning_edit_screen/bindings/planning_edit_screen_binding.dart';
import '../modules/planning_edit_screen/views/planning_edit_screen_view.dart';
import '../modules/planning_screen/bindings/planning_screen_binding.dart';
import '../modules/planning_screen/views/planning_screen_view.dart';
import '../modules/profile_screen/bindings/profile_screen_binding.dart';
import '../modules/profile_screen/views/profile_screen_view.dart';
import '../modules/realization_add_item_screen/bindings/realization_add_item_screen_binding.dart';
import '../modules/realization_add_item_screen/views/realization_add_item_screen_view.dart';
import '../modules/realization_detail_screen/bindings/realization_detail_screen_binding.dart';
import '../modules/realization_detail_screen/views/realization_detail_screen_view.dart';
import '../modules/realization_edit_item_screen/bindings/realization_edit_item_screen_binding.dart';
import '../modules/realization_edit_item_screen/views/realization_edit_item_screen_view.dart';
import '../modules/realization_edit_screen/bindings/realization_edit_screen_binding.dart';
import '../modules/realization_edit_screen/views/realization_edit_screen_view.dart';
import '../modules/realization_screen/bindings/realization_screen_binding.dart';
import '../modules/realization_screen/views/realization_screen_view.dart';
import '../modules/register_screen/bindings/register_screen_binding.dart';
import '../modules/register_screen/views/register_screen_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

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
      name: _Paths.PROFILE_SCREEN,
      page: () => const ProfileScreenView(),
      binding: ProfileScreenBinding(),
    ),
    GetPage(
      name: _Paths.FILTER_SCREEN,
      page: () {
        final homeController = Get.find<HomeScreenController>();

        return FilterScreenView(
          onApplyFilter: (String selectedType) {
            homeController.updateTransactionTypeFilter(selectedType);
          },
        );
      },
      binding: FilterScreenBinding(),
    ),
    GetPage(
      name: _Paths.PLANNING_SCREEN,
      page: () => const PlanningScreenView(),
      binding: PlanningScreenBinding(),
    ),
    GetPage(
      name: _Paths.PLANNING_EDIT_SCREEN,
      page: () => const PlanningEditScreenView(),
      binding: PlanningEditScreenBinding(),
    ),
    GetPage(
      name: _Paths.PLANNING_ADD_SCREEN,
      page: () => const PlanningAddScreenView(),
      binding: PlanningAddScreenBinding(),
    ),
    GetPage(
      name: _Paths.COMPARE_SCREEN,
      page: () => const CompareScreenView(),
      binding: CompareScreenBinding(),
    ),
    GetPage(
      name: _Paths.REALIZATION_SCREEN,
      page: () => const RealizationScreenView(),
      binding: RealizationScreenBinding(),
    ),
    GetPage(
      name: _Paths.COMPARE_DETAILS_SCREEN,
      page: () => const CompareDetailsScreenView(),
      binding: CompareDetailsScreenBinding(),
    ),
    GetPage(
      name: _Paths.PLANNING_DETAIL_SCREEN,
      page: () => const PlanningDetailScreenView(),
      binding: PlanningDetailScreenBinding(),
    ),
    GetPage(
      name: _Paths.REALIZATION_DETAIL_SCREEN,
      page: () => const RealizationDetailScreenView(),
      binding: RealizationDetailScreenBinding(),
    ),
    GetPage(
      name: _Paths.REALIZATION_EDIT_SCREEN,
      page: () => const RealizationEditScreenView(),
      binding: RealizationEditScreenBinding(),
    ),
    GetPage(
      name: _Paths.REALIZATION_ADD_ITEM_SCREEN,
      page: () => const RealizationAddItemScreenView(),
      binding: RealizationAddItemScreenBinding(),
    ),
    GetPage(
      name: _Paths.EXPENSES_SCREEN,
      page: () => const ExpensesScreenView(),
      binding: ExpensesScreenBinding(),
    ),
    GetPage(
      name: _Paths.APPROVAL_DETAIL_SCREEN,
      page: () => const ApprovalDetailScreenView(),
      binding: ApprovalDetailScreenBinding(),
    ),
    GetPage(
      name: _Paths.REALIZATION_EDIT_ITEM_SCREEN,
      page: () => const RealizationEditItemScreenView(),
      binding: RealizationEditItemScreenBinding(),
    ),
    GetPage(
      name: _Paths.PLANNING_EDIT_ITEM_SCREEN,
      page: () => const PlanningEditItemScreenView(),
      binding: PlanningEditItemScreenBinding(),
    ),
  ];
}
