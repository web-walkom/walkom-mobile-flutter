import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:walkom_mobile_flutter/features/excursion/bloc/excursion_bloc.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/excursions.dart';

class ExcursionScreen extends StatefulWidget {
  const ExcursionScreen({
    super.key,
    // required this.excursion,
  });

  // final ExcursionItem excursion;

  @override
  State<ExcursionScreen> createState() => _ExcursionScreenState();
}

class _ExcursionScreenState extends State<ExcursionScreen> {
  final _excursionBloc = ExcursionBloc(
    GetIt.I<ExcursionsRepository>(),
  );

  @override
  void initState() {
    _excursionBloc.add(LoadExcursion(excursionId: "widget.excursion.id"));
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();

  //   final args = ModalRoute.of(context)?.settings.arguments;
  //   assert(args != null && args is! ExcursionItem,
  //       'Args must provide is ExcursionItem');
  //   excursion = args as ExcursionItem;
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ExcursionBloc, ExcursionState>(
        bloc: _excursionBloc,
        builder: (context, state) {
          if (state is ExcursionLoaded) {
            return Text(state.excursion.description);
          }

          if (state is ExcursionError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Ошибка при получении данных'),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      _excursionBloc.add(
                          LoadExcursion(excursionId: "widget.excursion.id"));
                    },
                    child: const Text('Попробвать снова'),
                  )
                ],
              ),
            );
          }

          return const Center(
            child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: Colors.black,
                strokeWidth: 1.5,
              ),
            ),
          );
        },
      ),
    );
  }
}
