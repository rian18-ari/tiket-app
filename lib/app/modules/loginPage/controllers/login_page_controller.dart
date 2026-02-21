import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_trial/app/data/services/tiket_services.dart';
import 'package:news_trial/app/routes/app_pages.dart';

class LoginPageController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isPasswordHidden = true.obs;
  final isLoading = false.obs;

  final tiketServices = Get.find<TiketServices>();
  final _box = GetStorage();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void login() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Email dan Password tidak boleh kosong',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      isLoading.value = true;

      // Menggunakan debugPrint agar terlihat jelas di terminal Fedora
      debugPrint("ARI_LOG: Sedang memanggil API...");

      final response = await tiketServices.getTiket();

      debugPrint("ARI_LOG: Status API: ${response.status}");

      if (response.status == 200) {
        // Memastikan proses tulis ke storage selesai sebelum pindah halaman
        await _box.write('token', 'logged_in');
        await _box.write('user_email', email);

        Get.snackbar(
          'Berhasil',
          'Login berhasil!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        Get.offAllNamed(Routes.HOME_PAGE);
      } else {
        // Mengambil pesan error dari response jika ada, jika tidak pakai default
        _showErrorSnackbar(
          response.message ?? 'Login gagal, silakan coba lagi.',
        );
      }
    } catch (e) {
      debugPrint("ARI_LOG: Terjadi Exception: $e");
      _showErrorSnackbar('Terjadi kesalahan sistem.');
    } finally {
      isLoading.value = false;
    }
  }

  // Helper method untuk menampilkan snackbar error agar kode lebih bersih
  void _showErrorSnackbar(String message) {
    Get.snackbar(
      'Gagal',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  void logout() {
    _box.remove('token');
    _box.remove('user_email');
    Get.offAllNamed(Routes.LOGIN_PAGE);
  }
}
