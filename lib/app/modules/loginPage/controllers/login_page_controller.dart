import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_trial/app/data/services/tiket_services.dart';
import 'package:news_trial/app/routes/app_pages.dart';

class LoginPageController extends GetxController {
  // Text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Observable untuk sembunyikan/tampilkan password
  final isPasswordHidden = true.obs;

  // Observable untuk loading state
  final isLoading = false.obs;

  final tiketServices = Get.find<TiketServices>();
  final _box = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  // Login method
  void login() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    // Validasi email
    if (email.isEmpty) {
      Get.snackbar(
        'Error',
        'Email tidak boleh kosong',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // Validasi password
    if (password.isEmpty) {
      Get.snackbar(
        'Error',
        'Password tidak boleh kosong',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      isLoading.value = true;
      final response = await tiketServices.getTiket();

      if (response.status == 200) {
        // ✅ Simpan token ke GetStorage agar middleware bisa membacanya
        await _box.write('token', 'logged_in');
        await _box.write('user_email', email);

        Get.snackbar(
          'Berhasil',
          'Login berhasil!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        // Navigasi ke halaman home setelah login berhasil
        Get.offAllNamed(Routes.HOME_PAGE);
      } else {
        Get.snackbar(
          'Gagal',
          response.message ?? 'Login gagal, coba lagi.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Logout method — hapus token dari storage
  void logout() {
    _box.remove('token');
    _box.remove('user_email');
    Get.offAllNamed(Routes.LOGIN_PAGE);
  }
}
