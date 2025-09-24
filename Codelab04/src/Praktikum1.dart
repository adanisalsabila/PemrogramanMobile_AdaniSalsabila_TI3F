void main() {
  var list = [1, 2, 3];
  assert(list.length == 3);
  assert(list[1] == 2);
  print(list.length);
  print(list[1]);

  list[1] = 1;
  assert(list[1] == 1);
  print(list[1]);

  final List<dynamic> dataDiri = List.filled(6, null);

  dataDiri[1] = "Adani Salsabila"; 
  dataDiri[2] = "2341720123";  

  print("\n--- Data Diri Anda ---");
  print("Isi list 'dataDiri': $dataDiri");
  print("Panjang list 'dataDiri': ${dataDiri.length}");
  print("Elemen pada indeks 1: ${dataDiri[1]}");
  print("Elemen pada indeks 2: ${dataDiri[2]}");
}
