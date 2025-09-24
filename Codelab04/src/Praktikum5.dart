void main() {
  var record = ('first', a: 2, b: true, 'last');
  print(record);
  var recordToSwap = (10, 20);
  print("Before swap: $recordToSwap");

  var swapped = tukar(recordToSwap);
  print("After swap: $swapped");

  (String, int) mahasiswa;
  mahasiswa = ("Adani Salsabila", 2341720123);

  print(mahasiswa);

  var mahasiswa2 = ('Adani Salsabila', a: 2341720123, b: true, 'last');

  print(mahasiswa2.$1); 
  print(mahasiswa2.a);  
  print(mahasiswa2.b);  
  print(mahasiswa2.$2); 
}

(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}
