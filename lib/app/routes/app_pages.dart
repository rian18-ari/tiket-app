import 'package:get/get.dart';

import '../auth/auth_middleware.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/homePage/bindings/home_page_binding.dart';
import '../modules/homePage/views/home_page_view.dart';
import '../modules/loginPage/bindings/login_page_binding.dart';
import '../modules/loginPage/views/login_page_view.dart';
import '../modules/ticketPage/bindings/ticket_page_binding.dart';
import '../modules/ticketPage/views/ticket_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN_PAGE;

  static final routes = [
    // ✅ Halaman login — TIDAK perlu middleware (akses bebas)
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => const LoginPageView(),
      binding: LoginPageBinding(),
    ),

    // 🔒 Halaman yang dilindungi middleware — harus sudah login
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => const HomePageView(),
      binding: HomePageBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.TICKET_PAGE,
      page: () => const TicketPageView(),
      binding: TicketPageBinding(),
      middlewares: [AuthMiddleware()],
    ),
  ];
}
