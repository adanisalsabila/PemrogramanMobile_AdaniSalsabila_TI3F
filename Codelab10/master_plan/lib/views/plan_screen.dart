import 'package:flutter/material.dart';
// Import data_layer.dart untuk mengakses class Plan dan Task
import '../models/data_layer.dart'; 

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  // 1. STATE: Variabel untuk menyimpan state aplikasi (daftar rencana)
  Plan plan = const Plan(); 
  
  // 2. SCROLL CONTROLLER: Digunakan untuk mengontrol ListView
  late ScrollController scrollController; 

  // --- LIFECYCLE METHOD: INITSTATE ---
  @override
  void initState() {
    super.initState();
    // Inisialisasi controller dan tambahkan listener untuk menghilangkan fokus keyboard saat scroll
    scrollController = ScrollController()
      ..addListener(() {
        // Hilangkan fokus dari semua TextField saat scrolling
        FocusScope.of(context).requestFocus(FocusNode()); 
      });
  }

  // --- LIFECYCLE METHOD: DISPOSE ---
  @override
  void dispose() {
    // Bersihkan controller saat widget dihapus (penting untuk mencegah memory leak)
    scrollController.dispose();
    super.dispose();
  }

  // --- BUILD METHOD UTAMA ---
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Ganti ‘Namaku' dengan Nama panggilan Anda
      appBar: AppBar(
        title: const Text('Master Plan Adani Salsabila'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _buildList(),
      floatingActionButton: _buildAddTaskButton(),
    );
  }

  // --- METHOD UNTUK MEMBANGUN LIST TUGAS (VIEW) ---
  Widget _buildList() {
    return ListView.builder(
      // Tambahkan controller yang sudah diinisialisasi
      controller: scrollController, 
      // Mengatur perilaku keyboard saat scroll (khususnya untuk iOS)
      keyboardDismissBehavior: Theme.of(context).platform == TargetPlatform.iOS
          ? ScrollViewKeyboardDismissBehavior.onDrag // iOS: dismiss saat drag
          : ScrollViewKeyboardDismissBehavior.manual, // Lainnya: manual
      
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) =>
          _buildTaskTile(plan.tasks[index], index),
    );
  }

  // --- METHOD UNTUK MEMBANGUN LIST TILE UNTUK SETIAP TUGAS (VIEW ITEM) ---
  Widget _buildTaskTile(Task task, int index) {
    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          // UPDATE STATE: Memperbarui status 'complete' tugas
          setState(() {
            plan = Plan(
              name: plan.name,
              // Membuat salinan List<Task> dan memodifikasi Task pada [index]
              tasks: List<Task>.from(plan.tasks)
                ..[index] = Task(
                  description: task.description,
                  complete: selected ?? false,
                ),
            );
          });
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          // UPDATE STATE: Memperbarui 'description' tugas
          setState(() {
            plan = Plan(
              name: plan.name,
              // Membuat salinan List<Task> dan memodifikasi Task pada [index]
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

  // --- METHOD UNTUK MEMBANGUN TOMBOL TAMBAH TUGAS (ACTION) ---
  Widget _buildAddTaskButton() {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        // UPDATE STATE: Menambahkan Task baru ke daftar
        setState(() {
          plan = Plan(
            name: plan.name,
            // Membuat salinan List<Task> dan menambahkan Task baru
            tasks: List<Task>.from(plan.tasks)..add(const Task()),
          );
        });
      },
    );
  }
}