class HumicValidators {
  // LOGIN VALIDATION

  static String? loginEmailValidate(String? value) {
    // Validasi Email kosong
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong.';
    }

    // Validasi Format Email
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Silahkan masukkan format email yang valid.';
    }

    return null;
  }

  static String? loginPasswordValidate(String? value) {
    // Validasi Password kosong
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong.';
    }

    // Validasi  password kurang dari 6 karakter
    if (value.length < 6) {
      return 'Password harus terdiri dari minimal 6 karakter.';
    }

    // Validasi password lebih dari 15 karakter
    if (value.length > 15) {
      return 'Password tidak boleh lebih dari 15 karakter.';
    }

    // Validasi angka
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password harus mengandung setidaknya satu angka.';
    }
    return null;
  }

  // REGISTER VALIDATION

  static String? registerNameValidate(String? value) {
    // Validasi Nama kosong
    if (value == null || value.isEmpty) {
      return 'Nama tidak boleh kosong.';
    }
    // Validasi Nama kurang dari 5 karakter
    if (value.length <= 5) {
      return 'Nama harus terdiri dari minimal 5 karakter.';
    }

    // Validasi Nama lebih dari 20 karakter
    if (value.length >= 25) {
      return 'Nama tidak boleh lebih dari 25 karakter.';
    }

    // Tidak ada karakter special
    if (!RegExp(r"^[a-zA-Z\s'-]{2,50}$").hasMatch(value)) {
      return ('Nama hanya boleh mengandung huruf, spasi, tanda kutip, atau tanda hubung.');
    }
    return null;
  }

  static String? registerEmailValidate(String? value) {
    // Validasi Email kosong
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong.';
    }

    // Validasi Format Email
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Silahkan masukkan format email yang valid.';
    }

    return null;
  }

  static String? registerPasswordValidate(String? value) {
    // Validasi Password kosong
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong.';
    }

    // Validasi  password kurang dari 7 karakter
    if (value.length < 7) {
      return 'Password harus terdiri dari minimal 6 karakter.';
    }

    // Validasi password lebih dari 15 karakter
    if (value.length >= 15) {
      return 'Password tidak boleh lebih dari 15 karakter.';
    }

    // Validasi angka
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password harus mengandung setidaknya satu angka.';
    }
    return null;
  }

  static String? registerConfirmPasswordValidate(
      String? value, String password) {
    // Validasi Password kosong
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong.';
    }

    // Validasi  password kurang dari 7 karakter
    if (value.length < 7) {
      return 'Password harus terdiri dari minimal 6 karakter.';
    }

    // Validasi password lebih dari 15 karakter
    if (value.length >= 15) {
      return 'Password tidak boleh lebih dari 15 karakter.';
    }

    // Validasi angka
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password harus mengandung setidaknya satu angka.';
    }

    // Validasi dengan form Password
    if (value != password) {
      return 'Password yang anda masukkan tidak sama';
    }
    return null;
  }
}
