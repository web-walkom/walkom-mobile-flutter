import 'package:flutter/material.dart';

class ExcursionScreen extends StatefulWidget {
  const ExcursionScreen({super.key});

  @override
  State<ExcursionScreen> createState() => _ExcursionScreenState();
}

class _ExcursionScreenState extends State<ExcursionScreen> {
  String? excursionId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'Args must provide is String');
    excursionId = args as String;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(excursionId ?? '...'),
        centerTitle: true,
      ),
    );
  }
}
