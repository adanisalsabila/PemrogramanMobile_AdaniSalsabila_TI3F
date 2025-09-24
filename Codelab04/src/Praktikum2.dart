void main() {
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print(halogens);

  var names1 = <String>{};
  Set<String> names2 = {};
  var names3 = {};

  print(names1);
  print(names2);
  print(names3);

  var halogens2 = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print(halogens2);

  var names12 = <String>{};
  Set<String> names22 = {};

  // Tambah dengan .add()
  names12.add("Adani Salsabila - 123456789");

  // Tambah dengan .addAll()
  names22.addAll({"Adani Salsabila", "123456789"});

  print(names12);
  print(names22);
}
