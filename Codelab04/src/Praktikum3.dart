void main() {
  // Map dengan key String dan value String
  var gifts = {
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings',
    'nama': 'Adani Salsabila',
    'nim': '123456789'
  };

  // Map dengan key int dan value String
  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
    99: 'Adani Salsabila',
    100: '123456789'
  };

  print(gifts);
  print(nobleGases);

  // Map kosong dengan tipe eksplisit
  var mhs1 = Map<String, String>();
  mhs1['nama'] = 'Adani Salsabila';
  mhs1['nim'] = '2341720123';

  var mhs2 = Map<int, String>();
  mhs2[1] = 'Adani Salsabila';
  mhs2[2] = '2341720123';

  print(mhs1);
  print(mhs2);
}
