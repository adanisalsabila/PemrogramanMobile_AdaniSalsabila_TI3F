// file: functions_examples.dart

// --- b. Jenis-jenis Parameter ---

// Positional Parameters
void tambah(int a, int b) {
  print("Hasil tambah: ${a + b}");
}

// Optional Positional Parameters
void greet(String nama, [String? pesan]) {
  print("Hai $nama, ${pesan ?? 'Selamat datang!'}");
}

// Named Parameters
void info({String? nama, int umur = 0}) {
  print("Nama: $nama, Umur: $umur");
}

// Required Named Parameters
void profil({required String nama, required int umur}) {
  print("Nama: $nama, Umur: $umur");
}

// --- c. Functions sebagai First-Class Objects ---
void halo(String nama) {
  print("Halo, $nama!");
}

void jalankan(Function f, String value) {
  f(value);
}

// --- d. Anonymous Functions ---
void contohAnonymous() {
  var daftar = ['A', 'B', 'C'];
  daftar.forEach((item) {
    print("Item: $item");
  });
}

// --- e. Lexical Scope & Closure ---
void contohLexicalScope() {
  var x = 10;
  void tampil() {
    print("Lexical Scope: $x");
  }
  tampil();
}

Function buatCounter() {
  int hitung = 0;
  return () {
    hitung++;
    return hitung;
  };
}

// --- f. Return Multiple Value ---
// Versi List
List<int> operasiList(int a, int b) {
  return [a + b, a - b, a * b];
}

// Versi Map
Map<String, int> operasiMap(int a, int b) {
  return {
    "tambah": a + b,
    "kurang": a - b,
    "kali": a * b
  };
}

// Versi Record (fitur baru Dart 3)
(String, int) dataRecord() {
  return ("Salsa", 21);
}

// --- MAIN PROGRAM ---
void main() {
  print("=== Jenis Parameter ===");
  tambah(3, 5);
  greet("Adani");
  greet("Adani", "Semangat belajar!");
  info(nama: "Salsabila", umur: 21);
  profil(nama: "Adani Salsabila", umur: 20);

  print("\n=== First-Class Function ===");
  var sayHello = halo;
  sayHello("Adani");
  jalankan(halo, "Salsabila");

  print("\n=== Anonymous Function ===");
  contohAnonymous();

  print("\n=== Lexical Scope ===");
  contohLexicalScope();

  print("\n=== Lexical Closure ===");
  var counter = buatCounter();
  print("Counter: ${counter()}");
  print("Counter: ${counter()}");
  print("Counter: ${counter()}");

  print("\n=== Return Multiple Value ===");
  var hasilList = operasiList(5, 3);
  print("List -> Tambah: ${hasilList[0]}, Kurang: ${hasilList[1]}, Kali: ${hasilList[2]}");

  var hasilMap = operasiMap(5, 3);
  print("Map -> Tambah: ${hasilMap['tambah']}, Kurang: ${hasilMap['kurang']}, Kali: ${hasilMap['kali']}");

  var (nama, umur) = dataRecord();
  print("Record -> Nama: $nama, Umur: $umur");
}
