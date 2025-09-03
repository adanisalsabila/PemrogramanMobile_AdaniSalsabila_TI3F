late String deskripsi;

void main() {
  deskripsi = "ini adalah contoh variabel late.";

  print(deskripsi);

  late double hasilPerhitungan;

  void hitung() {
    hasilPerhitungan = 5 * 10.5;
  }

  hitung();

  print("Hasil perhitungan: $hasilPerhitungan");
}