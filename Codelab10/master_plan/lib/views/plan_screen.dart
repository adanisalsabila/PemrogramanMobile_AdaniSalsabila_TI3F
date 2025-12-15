import '../models/data_layer.dart';
import 'package:flutter/material.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  // Data awal (Plan kosong)
  Plan plan = const Plan();
  
  // Variabel untuk menangani scroll (Langkah 10)
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    // Inisialisasi scroll controller & listener keyboard (Langkah 11)
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  void dispose() {
    // Membersihkan controller saat widget dihancurkan (Langkah 13)
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // GANTI 'Nama Panggilan' dengan nama Anda
      appBar: AppBar(title: const Text('Master Plan - Adani Salsabila')), 
      body: _buildList(),
      floatingActionButton: _buildAddTaskButton(),
    );
  }

  // Widget Tombol Tambah (FAB)
  Widget _buildAddTaskButton() {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        setState(() {
          // Menambah task baru ke dalam list
          plan = Plan(
            name: plan.name,
            tasks: List<Task>.from(plan.tasks)..add(const Task()),
          );
        });
      },
    );
  }

  // Widget List Utama
  Widget _buildList() {
    return ListView.builder(
      controller: scrollController, // Pasang controller di sini
      // Mengatur perilaku keyboard saat di-scroll (Langkah 12)
      keyboardDismissBehavior: Theme.of(context).platform == TargetPlatform.iOS
          ? ScrollViewKeyboardDismissBehavior.onDrag
          : ScrollViewKeyboardDismissBehavior.manual,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) => _buildTaskTile(plan.tasks[index], index),
    );
  }

  // Widget Item Per Tugas (Checkbox + Input Teks)
  Widget _buildTaskTile(Task task, int index) {
    return ListTile(
      leading: Checkbox(
          value: task.complete,
          onChanged: (selected) {
            setState(() {
              plan = Plan(
                name: plan.name,
                tasks: List<Task>.from(plan.tasks)
                  ..[index] = Task(
                    description: task.description,
                    complete: selected ?? false,
                  ),
              );
            });
          }),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          setState(() {
            plan = Plan(
              name: plan.name,
              tasks: List<Task>.from(plan.tasks)
                ..[index] = Task(
                  description: text,
                  complete: task.complete,
                ),
            );
          });
        },
      ),
    );
  }
}