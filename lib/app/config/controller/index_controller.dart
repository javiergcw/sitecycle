import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sitecycle/app/feauture/presentation/ui/dashboard/NFTdashboard_screen.dart';
import 'package:sitecycle/app/feauture/presentation/ui/dashboard/dashboard_1_screen.dart';
import 'package:sitecycle/app/feauture/presentation/ui/dashboard/dashboard_screen.dart';
import 'package:sitecycle/app/feauture/presentation/ui/pages/blank_page.dart';
import 'package:sitecycle/app/feauture/presentation/ui/pages/coming_soon_page.dart';
import 'package:sitecycle/app/feauture/presentation/ui/pages/error_page.dart';
import 'package:sitecycle/app/feauture/presentation/ui/pages/maintence_page.dart';
import 'package:sitecycle/app/feauture/presentation/ui/pages/two_step_verification_screen.dart';
import 'package:sitecycle/app/feauture/presentation/ui/tables/canban_screen.dart';
import 'package:sitecycle/app/feauture/presentation/ui/tables/datatable_screen.dart';
import 'package:sitecycle/app/feauture/presentation/ui/tables/table_screen.dart';

class IndexController extends GetxController implements GetxService {
  int selectPage = 1;

  List page12 = [
    const Dashboard(), // 0
    const Dashboard(), // 1
    const Dashboard1Screen(), // 2
     const MarketPlaceScreen(), // 3
    const TableScreen(), // 4
   const CanBanScreen(), // 5
    const DataTableScreen(), // 6
    // const BillingScreen(), // 7
    // const ApplicationScreen(), // 8
    // const InvoiceScreen(), // 9
    // const Setting1Screen(), // 10
    // const NewProductScreen(), // 11
    // const ProductOverviewScreen(), // 12
    // const ProductSettingScreen(), // 13
    // const ProductPageScreen(), // 14
    // const OrderListScreen(), // 15
    // const OrderDetailScreen(), // 16
    // const AnalyicsScreen(), // 17
    // const SaleScreen(), // 18
    // const ProductScreen(), // 19
    // const customerScreen(), // 20
    // const PayoutScreen(), // 21
    // const ProfileScreen(), // 22
    // const ProfileV2Screen(), // 23
    // const ProfileSettingScreen(), // 24
    // const NewsFeedScreen(), // 25
    // const InboxScreen(), // 26
    // const SettingsScreen(), // 27
    // const BlogPage(), // 28
    // const FaqPage(), // 29
    // const PricingPage(), // 30
    // const TestimonialPage(), // 31
    // const TermConditionPage(), // 32
    const TwostepVerificationPage(), // 33
    const ErrorPage(), // 34
    const ComingsoonPage(), // 35
    const MaintenancePage(), // 36
    const BlacnkPage(), // 37
  ];

  setTextIsTrue(int value) {
    selectPage = value;
    update();
  }
}
