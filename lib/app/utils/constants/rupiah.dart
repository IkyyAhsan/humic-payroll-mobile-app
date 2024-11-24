String formatRupiah(int number) {
  // Menggunakan RegExp untuk menambahkan titik setelah setiap 3 angka
  return 'Rp${number.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]}.')}';
}
