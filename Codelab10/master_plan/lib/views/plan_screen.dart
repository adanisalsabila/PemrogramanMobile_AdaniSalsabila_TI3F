// import '../models/data_layer.dart';
// import 'package:flutter/material.dart';

// class PlanScreen extends StatefulWidget {
//   const PlanScreen({super.key});

//   @override
//   State createState() => _PlanScreenState();
// }

// class _PlanScreenState extends State<PlanScreen> {
//   // Data awal (Plan kosong)
//   Plan plan = const Plan();
  
//   // Variabel untuk menangani scroll (Langkah 10)
//   late ScrollController scrollController;

//   @override
//   void initState() {
//     super.initState();
//     // Inisialisasi scroll controller & listener keyboard (Langkah 11)
//     scrollController = ScrollController()
//       ..addListener(() {
//         FocusScope.of(context).requestFocus(FocusNode());
//       });
//   }

//   @override
//   void dispose() {
//     // Membersihkan controller saat widget dihancurkan (Langkah 13)
//     scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // GANTI 'Nama Panggilan' dengan nama Anda
//       appBar: AppBar(title: const Text('Master Plan - Adani Salsabila')), 
//       body: _buildList(),
//       floatingActionButton: _buildAddTaskButton(),
//     );
//   }

//   // Widget Tombol Tambah (FAB)
//   Widget _buildAddTaskButton() {
//     return FloatingActionButton(
//       child: const Icon(Icons.add),
//       onPressed: () {
//         setState(() {
//           // Menambah task baru ke dalam list
//           plan = Plan(
//             name: plan.name,
//             tasks: List<Task>.from(plan.tasks)..add(const Task()),
//           );
//         });
//       },
//     );
//   }

//   // Widget List Utama
//   Widget _buildList() {
//     return ListView.builder(
//       controller: scrollController, // Pasang controller di sini
//       // Mengatur perilaku keyboard saat di-scroll (Langkah 12)
//       keyboardDismissBehavior: Theme.of(context).platform == TargetPlatform.iOS
//           ? ScrollViewKeyboardDismissBehavior.onDrag
//           : ScrollViewKeyboardDismissBehavior.manual,
//       itemCount: plan.tasks.length,
//       itemBuilder: (context, index) => _buildTaskTile(plan.tasks[index], index),
//     );
//   }

//   // Widget Item Per Tugas (Checkbox + Input Teks)
//   Widget _buildTaskTile(Task task, int index) {
//     return ListTile(
//       leading: Checkbox(
//           value: task.complete,
//           onChanged: (selected) {
//             setState(() {
//               plan = Plan(
//                 name: plan.name,
//                 tasks: List<Task>.from(plan.tasks)
//                   ..[index] = Task(
//                     description: task.description,
//                     complete: selected ?? false,
//                   ),
//               );
//             });
//           }),
//       title: TextFormField(
//         initialValue: task.description,
//         onChanged: (text) {
//           setState(() {
//             plan = Plan(
//               name: plan.name,
//               tasks: List<Task>.from(plan.tasks)
//                 ..[index] = Task(
//                   description: text,
//                   complete: task.complete,
//                 ),
//             );
//           });
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import '../models/data_layer.dart';
// import '../provider/plan_provider.dart'; // Import Provider

// class PlanScreen extends StatefulWidget {
//   const PlanScreen({super.key});

//   @override
//   State createState() => _PlanScreenState();
// }

// class _PlanScreenState extends State<PlanScreen> {
//   // HAPUS variabel 'Plan plan = const Plan();' karena sekarang data ada di Provider
//   late ScrollController scrollController;

//   @override
//   void initState() {
//     super.initState();
//     scrollController = ScrollController()
//       ..addListener(() {
//         FocusScope.of(context).requestFocus(FocusNode());
//       });
//   }

//   @override
//   void dispose() {
//     scrollController.dispose();
//     super.dispose();
//   }

//   // Langkah 9: Update method build dengan SafeArea dan Column
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Master Plan Adani')),
//       body: ValueListenableBuilder<Plan>(
//         valueListenable: PlanProvider.of(context),
//         builder: (context, plan, child) {
//           return Column(
//             children: [
//               Expanded(child: _buildList(plan)), // List tugas
//               SafeArea(child: Text(plan.completenessMessage)), // Footer progress
//             ],
//           );
//         },
//       ),
//       floatingActionButton: _buildAddTaskButton(context),
//     );
//   }

//   // Langkah 5: Tombol Tambah menggunakan Provider
//   Widget _buildAddTaskButton(BuildContext context) {
//     ValueNotifier<Plan> planNotifier = PlanProvider.of(context);
//     return FloatingActionButton(
//       child: const Icon(Icons.add),
//       onPressed: () {
//         Plan currentPlan = planNotifier.value;
//         planNotifier.value = Plan(
//           name: currentPlan.name,
//           tasks: List<Task>.from(currentPlan.tasks)..add(const Task()),
//         );
//       },
//     );
//   }

//   // Langkah 7: Menerima parameter Plan dari ValueListenableBuilder
//   Widget _buildList(Plan plan) {
//     return ListView.builder(
//       controller: scrollController,
//       keyboardDismissBehavior: Theme.of(context).platform == TargetPlatform.iOS
//           ? ScrollViewKeyboardDismissBehavior.onDrag
//           : ScrollViewKeyboardDismissBehavior.manual,
//       itemCount: plan.tasks.length,
//       itemBuilder: (context, index) =>
//           _buildTaskTile(plan.tasks[index], index, context),
//     );
//   }

//   // Langkah 6: Task Tile menggunakan Provider
//   Widget _buildTaskTile(Task task, int index, BuildContext context) {
//     ValueNotifier<Plan> planNotifier = PlanProvider.of(context);
//     return ListTile(
//       leading: Checkbox(
//           value: task.complete,
//           onChanged: (selected) {
//             Plan currentPlan = planNotifier.value;
//             planNotifier.value = Plan(
//               name: currentPlan.name,
//               tasks: List<Task>.from(currentPlan.tasks)
//                 ..[index] = Task(
//                   description: task.description,
//                   complete: selected ?? false,
//                 ),
//             );
//           }),
//       title: TextFormField(
//         initialValue: task.description,
//         onChanged: (text) {
//           Plan currentPlan = planNotifier.value;
//           planNotifier.value = Plan(
//             name: currentPlan.name,
//             tasks: List<Task>.from(currentPlan.tasks)
//               ..[index] = Task(
//                 description: text,
//                 complete: task.complete,
//               ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../models/data_layer.dart';
import '../provider/plan_provider.dart';

class PlanScreen extends StatefulWidget {
  // Langkah 3: Menambahkan atribut plan
  final Plan plan;
  const PlanScreen({super.key, required this.plan});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  late ScrollController scrollController;
  
  // Langkah 5: Getter untuk mengambil plan dari widget
  Plan get plan => widget.plan;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  // Langkah 7: Method build
  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<Plan>> plansNotifier = PlanProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(plan.name)),
      body: ValueListenableBuilder<List<Plan>>(
        valueListenable: plansNotifier,
        builder: (context, plans, child) {
          // Mengambil plan terbaru dari list berdasarkan nama
          Plan currentPlan = plans.firstWhere((p) => p.name == plan.name);
          return Column(
            children: [
              Expanded(child: _buildList(currentPlan)),
              SafeArea(child: Text(currentPlan.completenessMessage)),
            ],
          );
        },
      ),
      floatingActionButton: _buildAddTaskButton(context),
    );
  }

  Widget _buildAddTaskButton(BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        Plan currentPlan = plan;
        int planIndex =
            planNotifier.value.indexWhere((p) => p.name == currentPlan.name);
        List<Task> updatedTasks = List<Task>.from(currentPlan.tasks)
          ..add(const Task());
        
        // Update list global
        planNotifier.value = List<Plan>.from(planNotifier.value)
          ..[planIndex] = Plan(
            name: currentPlan.name,
            tasks: updatedTasks,
          );
      },
    );
  }

  Widget _buildList(Plan plan) {
    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) =>
          _buildTaskTile(plan.tasks[index], index, context),
    );
  }

  // Langkah 8: Edit _buildTaskTile
  Widget _buildTaskTile(Task task, int index, BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);

    return ListTile(
      leading: Checkbox(
          value: task.complete,
          onChanged: (selected) {
            Plan currentPlan = plan;
            int planIndex = planNotifier.value
                .indexWhere((p) => p.name == currentPlan.name);
            planNotifier.value = List<Plan>.from(planNotifier.value)
              ..[planIndex] = Plan(
                name: currentPlan.name,
                tasks: List<Task>.from(currentPlan.tasks)
                  ..[index] = Task(
                    description: task.description,
                    complete: selected ?? false,
                  ),
              );
          }),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          Plan currentPlan = plan;
          int planIndex = planNotifier.value
              .indexWhere((p) => p.name == currentPlan.name);
          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..[planIndex] = Plan(
              name: currentPlan.name,
              tasks: List<Task>.from(currentPlan.tasks)
                ..[index] = Task(
                  description: text,
                  complete: task.complete,
                ),
            );
        },
      ),
    );
  }
}