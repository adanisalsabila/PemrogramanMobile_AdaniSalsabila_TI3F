// import 'package:flutter/material.dart';
// import './views/plan_screen.dart';

// void main() => runApp(const MasterPlanApp());

// class MasterPlanApp extends StatelessWidget {
//   const MasterPlanApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Master Plan',
//       theme: ThemeData(primarySwatch: Colors.purple),
//       home: const PlanScreen(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:master_plan/models/data_layer.dart'; // Pastikan import model benar
import 'package:master_plan/provider/plan_provider.dart'; // Import provider baru
import './views/plan_screen.dart';

void main() => runApp(const MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: PlanProvider( // Membungkus PlanScreen dengan Provider
        notifier: ValueNotifier<Plan>(const Plan()),
        child: const PlanScreen(),
      ),
    );
  }
}