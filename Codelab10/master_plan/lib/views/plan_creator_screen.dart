import 'package:flutter/material.dart';
import '../models/data_layer.dart';
import '../provider/plan_provider.dart';
import 'plan_screen.dart';

class PlanCreatorScreen extends StatefulWidget {
  const PlanCreatorScreen({super.key});

  @override
  State createState() => _PlanCreatorScreenState();
}

class _PlanCreatorScreenState extends State<PlanCreatorScreen> {
  // Langkah 10: Text Controller
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  // Langkah 11: Build Method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // GANTI 'Namaku' dengan nama panggilan Anda
      appBar: AppBar(title: const Text('Master Plans Adani Salsabila')),
      body: Column(children: [
        _buildListCreator(),
        Expanded(child: _buildMasterPlans())
      ]),
    );
  }

  // Langkah 12: Widget input plan baru
  Widget _buildListCreator() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Material(
        color: Theme.of(context).cardColor,
        elevation: 10,
        child: TextField(
            controller: textController,
            decoration: const InputDecoration(
                labelText: 'Add a plan', contentPadding: EdgeInsets.all(20)),
            onEditingComplete: addPlan),
      ),
    );
  }

  // Langkah 13: Fungsi menambah plan
  void addPlan() {
    final text = textController.text;
    if (text.isEmpty) {
      return;
    }
    final plan = Plan(name: text, tasks: []);
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    
    // Menambah plan baru ke List Global
    planNotifier.value = List<Plan>.from(planNotifier.value)..add(plan);
    
    textController.clear();
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {}); // Rebuild UI untuk menghilangkan keyboard/update state lokal
  }

  // Langkah 14: Menampilkan daftar plan
  Widget _buildMasterPlans() {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    List<Plan> plans = planNotifier.value;

    if (plans.isEmpty) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.note, size: 100, color: Colors.grey),
            Text('Anda belum memiliki rencana apapun.',
                style: Theme.of(context).textTheme.headlineSmall)
          ]);
    }
    return ListView.builder(
        itemCount: plans.length,
        itemBuilder: (context, index) {
          final plan = plans[index];
          return ListTile(
              title: Text(plan.name),
              subtitle: Text(plan.completenessMessage),
              onTap: () {
                // Pindah ke PlanScreen membawa data plan yang dipilih
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => PlanScreen(
                          plan: plan,
                        )));
              });
        });
  }
}