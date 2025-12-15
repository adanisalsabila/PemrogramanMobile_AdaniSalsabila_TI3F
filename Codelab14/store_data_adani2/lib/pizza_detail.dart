// import 'package:flutter/material.dart';
// import 'pizza.dart';
// import 'httphelper.dart';

// class PizzaDetailScreen extends StatefulWidget {
//   const PizzaDetailScreen({super.key});

//   @override
//   State<PizzaDetailScreen> createState() => _PizzaDetailScreenState();
// }

// class _PizzaDetailScreenState extends State<PizzaDetailScreen> {
//   final TextEditingController txtId = TextEditingController();
//   final TextEditingController txtName = TextEditingController();
//   final TextEditingController txtDescription = TextEditingController();
//   final TextEditingController txtPrice = TextEditingController();
//   final TextEditingController txtImageUrl = TextEditingController();
//   // Controller untuk Field Baru (Soal 2)
//   final TextEditingController txtCrust = TextEditingController(); 

//   String operationResult = '';

//   @override
//   void dispose() {
//     txtId.dispose();
//     txtName.dispose();
//     txtDescription.dispose();
//     txtPrice.dispose();
//     txtImageUrl.dispose();
//     txtCrust.dispose(); // Dispose controller baru
//     super.dispose();
//   }

//   Future postPizza() async {
//     HttpHelper helper = HttpHelper();
    
//     // Membuat objek Pizza dari input user
//     Pizza pizza = Pizza(
//       id: int.tryParse(txtId.text) ?? 0,
//       pizzaName: txtName.text,
//       description: txtDescription.text,
//       price: double.tryParse(txtPrice.text) ?? 0.0,
//       imageUrl: txtImageUrl.text,
//       myCrust: txtCrust.text, // Masukkan data field baru
//     );

//     String result = await helper.postPizza(pizza);
//     setState(() {
//       operationResult = result;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Pizza Detail'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Text(
//                 operationResult,
//                 style: TextStyle(
//                   backgroundColor: Colors.green[200],
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 24),
//               TextField(
//                 controller: txtId,
//                 decoration: const InputDecoration(hintText: 'Insert ID'),
//                 keyboardType: TextInputType.number,
//               ),
//               const SizedBox(height: 24),
//               TextField(
//                 controller: txtName,
//                 decoration: const InputDecoration(hintText: 'Insert Pizza Name'),
//               ),
//               const SizedBox(height: 24),
//               TextField(
//                 controller: txtDescription,
//                 decoration: const InputDecoration(hintText: 'Insert Description'),
//               ),
//               const SizedBox(height: 24),
//               TextField(
//                 controller: txtPrice,
//                 decoration: const InputDecoration(hintText: 'Insert Price'),
//                 keyboardType: TextInputType.number,
//               ),
//               const SizedBox(height: 24),
//               TextField(
//                 controller: txtImageUrl,
//                 decoration: const InputDecoration(hintText: 'Insert Image Url'),
//               ),
//               const SizedBox(height: 24),
//               // Input Field Baru (Soal 2)
//               TextField(
//                 controller: txtCrust,
//                 decoration: const InputDecoration(hintText: 'Insert Crust (e.g. Cheese Burst)'),
//               ),
//               const SizedBox(height: 48),
//               ElevatedButton(
//                 child: const Text('Send Post'),
//                 onPressed: () {
//                   postPizza();
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'pizza.dart';
import 'httphelper.dart';

class PizzaDetailScreen extends StatefulWidget {
  // Tambahkan properti pizza dan isNew
  final Pizza pizza;
  final bool isNew;

  const PizzaDetailScreen({
    super.key,
    required this.pizza,
    required this.isNew,
  });

  @override
  State<PizzaDetailScreen> createState() => _PizzaDetailScreenState();
}

class _PizzaDetailScreenState extends State<PizzaDetailScreen> {
  final TextEditingController txtId = TextEditingController();
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtPrice = TextEditingController();
  final TextEditingController txtImageUrl = TextEditingController();
  final TextEditingController txtCrust = TextEditingController(); // Field Soal 2

  String operationResult = '';

  @override
  void initState() {
    super.initState();
    // Jika BUKAN baru (sedang Edit), isi textfield dengan data lama
    if (!widget.isNew) {
      txtId.text = widget.pizza.id.toString();
      txtName.text = widget.pizza.pizzaName;
      txtDescription.text = widget.pizza.description;
      txtPrice.text = widget.pizza.price.toString();
      txtImageUrl.text = widget.pizza.imageUrl;
      txtCrust.text = widget.pizza.myCrust;
    }
  }

  @override
  void dispose() {
    txtId.dispose();
    txtName.dispose();
    txtDescription.dispose();
    txtPrice.dispose();
    txtImageUrl.dispose();
    txtCrust.dispose();
    super.dispose();
  }

  Future savePizza() async {
    HttpHelper helper = HttpHelper();
    
    // Objek Pizza dari input user
    Pizza pizza = Pizza(
      id: int.tryParse(txtId.text) ?? 0,
      pizzaName: txtName.text,
      description: txtDescription.text,
      price: double.tryParse(txtPrice.text) ?? 0.0,
      imageUrl: txtImageUrl.text,
      myCrust: txtCrust.text,
    );

    // Logika Percabangan: POST (Baru) atau PUT (Edit)
    final result = await (widget.isNew
        ? helper.postPizza(pizza)
        : helper.putPizza(pizza));

    setState(() {
      operationResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Ubah judul tergantung konteks
        title: Text(widget.isNew ? 'New Pizza' : 'Edit Pizza'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                operationResult,
                style: TextStyle(
                  backgroundColor: Colors.green[200],
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: txtId,
                decoration: const InputDecoration(hintText: 'Insert ID'),
                keyboardType: TextInputType.number,
                // ID biasanya tidak boleh diedit jika update, tapi untuk latihan biarkan saja
              ),
              const SizedBox(height: 24),
              TextField(
                controller: txtName,
                decoration: const InputDecoration(hintText: 'Insert Pizza Name'),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: txtDescription,
                decoration: const InputDecoration(hintText: 'Insert Description'),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: txtPrice,
                decoration: const InputDecoration(hintText: 'Insert Price'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 24),
              TextField(
                controller: txtImageUrl,
                decoration: const InputDecoration(hintText: 'Insert Image Url'),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: txtCrust,
                decoration: const InputDecoration(hintText: 'Insert Crust'),
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                child: const Text('Save Pizza'),
                onPressed: () {
                  savePizza();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}