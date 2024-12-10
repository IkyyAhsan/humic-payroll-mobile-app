import 'dart:io';

bool checkFileExistence(String path) {
  try {
    final file = File(path);
    return file.existsSync(); // Mengembalikan true jika file ada
  } catch (e) {
    print("Error: $e");
    return false; // Jika ada error dalam pengecekan file
  }
}
