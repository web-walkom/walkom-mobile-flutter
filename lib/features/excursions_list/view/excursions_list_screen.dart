import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/features/excursions_list/widgets/widgets.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/excursions_repository.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/models/excursion.dart';

class ExcursionsListScreen extends StatefulWidget {
  const ExcursionsListScreen({super.key});

  @override
  State<ExcursionsListScreen> createState() => _ExcursionsListScreenState();
}

class _ExcursionsListScreenState extends State<ExcursionsListScreen> {
  List<ExcursionItem>? excursionsList;

  @override
  void initState() {
    __loadExcursions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Экскурсии'),
        centerTitle: true,
      ),
      body: (excursionsList == null)
          ? const Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.black,
                  strokeWidth: 1.5,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(top: 15),
              itemCount: excursionsList!.length,
              itemBuilder: (context, i) {
                return ExcursionTile(excursion: excursionsList![i]);
              },
            ),
    );
  }

  Future<void> __loadExcursions() async {
    excursionsList = await ExcursionsRepository().getExcursions();
    setState(() {});
  }
}
