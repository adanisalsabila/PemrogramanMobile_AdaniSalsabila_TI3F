void main() {
  List<int?> list1 = [1, 2, 3];   
  var list2 = [0, ...list1];
  print(list1);
  print(list2);
  print(list2.length);

  list1 = [1, 2, null];
  print(list1);

  var list3 = [0, ...?list1];
  print(list3);
  print(list3.length);

  var nim = ['2', '3', '4', '7', '2', '0', '1', '2', '3'];
  var listNim = [...nim];
  print(listNim);

  bool promoActive = true;
  var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print(nav);

  promoActive = false;
  var nav2 = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print(nav2);

  var login = 'Manager';
  var nav21 = ['Home', 'Furniture', 'Plants', if (login == 'Manager') 'Inventory'];
  print(nav21);

  login = 'Staff';
  var nav31 = ['Home', 'Furniture', 'Plants', if (login == 'Manager') 'Inventory'];
  print(nav31);

  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  print(listOfStrings);
}
