// // // import 'package:flutter/material.dart';
// // // import 'stream.dart'; 

// // // void main() {
// // //   runApp(const MyApp());
// // // }

// // // class MyApp extends StatelessWidget {
// // //   const MyApp({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'Stream Adani', // Soal 1: Nama panggilan
// // //       theme: ThemeData(
// // //         primarySwatch: Colors.teal, // Soal 1: Warna favorit (Ganti jika mau)
// // //       ),
// // //       home: const StreamHomePage(),
// // //     );
// // //   }
// // // }

// // // class StreamHomePage extends StatefulWidget {
// // //   const StreamHomePage({super.key});

// // //   @override
// // //   State<StreamHomePage> createState() => _StreamHomePageState();
// // // }

// // // // ... (kode main dan MyApp tetap sama) ...

// // // class _StreamHomePageState extends State<StreamHomePage> {
// // //   // Langkah 8: Tambah Variabel
// // //   Color bgColor = Colors.blueGrey;
// // //   late ColorStream colorStream;

// // //   // Langkah 9: Method changeColor (Versi await for)
// // //   Future<void> changeColor() async {
// // //     // await for loop digunakan untuk mendengarkan stream
// // //     await for (var eventColor in colorStream.getColors()) {
// // //       setState(() {
// // //         bgColor = eventColor;
// // //       });
// // //     }
// // //   }

// // //   // Langkah 10: Override initState
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     colorStream = ColorStream();
// // //     changeColor();
// // //   }

// // //   // Langkah 11: Ubah Scaffold
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text('Stream Adani'),
// // //       ),
// // //       body: Container(
// // //         decoration: BoxDecoration(color: bgColor),
// // //       ),
// // //     );
// // //   }
// // // }

// // // // class _StreamHomePageState extends State<StreamHomePage> {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: const Text('Stream Adani'), // Soal 1: Nama panggilan
// // // //       ),
// // // //       body: Container(
// // // //         decoration: BoxDecoration(color: Colors.white), // Nanti akan berubah
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // import 'package:flutter/material.dart';
// // import 'stream.dart';
// // import 'dart:async';
// // import 'dart:math';

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Stream Adani',
// //       theme: ThemeData(
// //         primarySwatch: Colors.teal,
// //       ),
// //       home: const StreamHomePage(),
// //     );
// //   }
// // }

// // class StreamHomePage extends StatefulWidget {
// //   const StreamHomePage({super.key});

// //   @override
// //   State<StreamHomePage> createState() => _StreamHomePageState();
// // }

// // class _StreamHomePageState extends State<StreamHomePage> {
// //   Color bgColor = Colors.blueGrey;
// //   late ColorStream colorStream;

// //   int lastNumber = 0;
// //   late NumberStream numberStream;
// //   late StreamController numberStreamController;
// //   late StreamSubscription subscription;
  
// //   // Langkah 1: Tambah variabel transformer
// //   late StreamTransformer transformer;

// //   void changeColor() {
// //     colorStream.getColors().listen((eventColor) {
// //       setState(() {
// //         bgColor = eventColor;
// //       });
// //     });
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     // Inisialisasi NumberStream
// //     numberStream = NumberStream();
// //     numberStreamController = numberStream.controller;
// //     Stream stream = numberStreamController.stream;

// //     // Langkah 2: Definisikan Transformer
// //     // Mengubah data (int) menjadi (int) dengan dikali 10
// //     transformer = StreamTransformer<int, int>.fromHandlers(
// //       handleData: (value, sink) {
// //         sink.add(value * 10); // Transformasi data: input * 10
// //       },
// //       handleError: (error, trace, sink) {
// //         sink.add(-1); // Kirim -1 jika error
// //       },
// //       handleDone: (sink) => sink.close(),
// //     );

// //     // Langkah 3: Gunakan transform() sebelum listen
// //     subscription = stream.transform(transformer).listen(
// //       (event) {
// //         setState(() {
// //           lastNumber = event;
// //         });
// //       },
// //       onError: (error) {
// //         setState(() {
// //           lastNumber = -1;
// //         });
// //       },
// //     );
// //   }

// //   @override
// //   void dispose() {
// //     numberStreamController.close();
// //     subscription.cancel();
// //     super.dispose();
// //   }

// //   void addRandomNumber() {
// //     Random random = Random();
// //     int myNum = random.nextInt(10);
// //     numberStream.addNumberToSink(myNum);
// //     // Pastikan addError di-comment untuk praktikum ini
// //     // numberStream.addError(); 
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Stream Adani'),
// //       ),
// //       body: SizedBox(
// //         width: double.infinity,
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: [
// //             Text(
// //               lastNumber.toString(),
// //               style: const TextStyle(
// //                 fontSize: 60,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //             ElevatedButton(
// //               onPressed: () => addRandomNumber(),
// //               child: const Text('New Random Number'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'stream.dart';
// import 'dart:async';
// import 'dart:math';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Stream Adani',
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//       ),
//       home: const StreamHomePage(),
//     );
//   }
// }

// class StreamHomePage extends StatefulWidget {
//   const StreamHomePage({super.key});

//   @override
//   State<StreamHomePage> createState() => _StreamHomePageState();
// }

// class _StreamHomePageState extends State<StreamHomePage> {
//   int lastNumber = 0;
//   late NumberStream numberStream;
//   late StreamController numberStreamController;
//   late StreamTransformer transformer;
  
//   // Langkah 1: Tambah variabel Subscription
//   late StreamSubscription subscription;

//   // Langkah 6: Edit dispose
//   @override
//   void dispose() {
//     numberStreamController.close();
//     subscription.cancel(); // Penting: Batalkan subscription saat widget hancur
//     super.dispose();
//   }

//   // Langkah 5: Tambah method stopStream
//   void stopStream() {
//     numberStreamController.close(); // Menutup stream controller
//   }

//   void addRandomNumber() {
//     Random random = Random();
//     int myNum = random.nextInt(10);
//     // Langkah 8: Pastikan data ditambah ke sink
//     if (!numberStreamController.isClosed) {
//       numberStream.addNumberToSink(myNum);
//     } else {
//       setState(() {
//         lastNumber = -1; // Indikator jika stream sudah closed
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     // Setup Stream
//     numberStream = NumberStream();
//     numberStreamController = numberStream.controller;
//     Stream stream = numberStreamController.stream;

//     // Setup Transformer (Dari Praktikum 3)
//     transformer = StreamTransformer<int, int>.fromHandlers(
//       handleData: (value, sink) {
//         sink.add(value * 10);
//       },
//       handleError: (error, trace, sink) {
//         sink.add(-1);
//       },
//       handleDone: (sink) => sink.close(),
//     );

//     // Langkah 2, 3, 4: Subscribe dengan handle onDone
//     subscription = stream.transform(transformer).listen(
//       (event) {
//         setState(() {
//           lastNumber = event;
//         });
//       },
//       onError: (error) {
//         setState(() {
//           lastNumber = -1;
//         });
//       },
//       onDone: () {
//         // Langkah 4: Properti onDone
//         print('OnDone was called'); 
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Stream Adani'),
//       ),
//       body: SizedBox(
//         width: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               lastNumber.toString(),
//               style: const TextStyle(
//                 fontSize: 60,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => addRandomNumber(),
//                   child: const Text('New Random Number'),
//                 ),
//                 const SizedBox(width: 20),
//                 // Langkah 7: Tambah button kedua
//                 ElevatedButton(
//                   onPressed: () => stopStream(),
//                   child: const Text('Stop Subscription'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'stream.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Adani',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  int lastNumber = 0;
  late NumberStream numberStream;
  late StreamController numberStreamController;
  late StreamTransformer transformer;
  late StreamSubscription subscription;

  // Langkah 1: Tambah variabel subscription2 dan values
  late StreamSubscription subscription2;
  String values = '';

  @override
  void dispose() {
    numberStreamController.close();
    subscription.cancel();
    subscription2.cancel(); // Jangan lupa cancel subscription kedua
    super.dispose();
  }

  void stopStream() {
    numberStreamController.close();
  }

  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);
    if (!numberStreamController.isClosed) {
      numberStream.addNumberToSink(myNum);
    } else {
      setState(() {
        lastNumber = -1;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;
    
    // Langkah 4: Set asBroadcastStream
    // Agar stream bisa didengarkan oleh banyak subscription
    Stream stream = numberStreamController.stream.asBroadcastStream();

    transformer = StreamTransformer<int, int>.fromHandlers(
      handleData: (value, sink) {
        sink.add(value * 10);
      },
      handleError: (error, trace, sink) {
        sink.add(-1);
      },
      handleDone: (sink) => sink.close(),
    );

    // Subscription 1 (Mengubah angka besar)
    subscription = stream.transform(transformer).listen(
      (event) {
        setState(() {
          lastNumber = event;
        });
      },
      onError: (error) {
        setState(() {
          lastNumber = -1;
        });
      },
      onDone: () {
        print('OnDone was called');
      },
    );

    // Langkah 2: Subscription 2 (Menambah string values)
    subscription2 = stream.listen((event) {
      setState(() {
        values += '$event - ';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Adani'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Tampilan angka besar (Subscription 1)
            Text(
              lastNumber.toString(),
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            // Langkah 5: Tampilan list angka (Subscription 2)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                values,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => addRandomNumber(),
                  child: const Text('New Random Number'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => stopStream(),
                  child: const Text('Stop Subscription'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}