void main() {
  String namanim = "Adani Salsabila - 2341720123";

  for (int i = 0; i <= 201; i++) {
    if (isPrima(i)) {
      print("$i adalah bilangan prima - $namanim");
    } else {
      print("$i bukan bilangan prima");
    }
  }
}

bool isPrima(int n) {
  if (n < 2) return false;
  for (int i = 2; i * i <= n; i++) {
    if (n % i == 0) return false;
  }
  return true;
}
