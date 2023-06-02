import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:walkom_mobile_flutter/features/excursions_list/bloc/excursions_list_bloc.dart';
import 'package:walkom_mobile_flutter/features/excursions_list/widgets/widgets.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/excursions.dart';

@RoutePage()
class ExcursionsListScreen extends StatefulWidget {
  const ExcursionsListScreen({super.key});

  @override
  State<ExcursionsListScreen> createState() => _ExcursionsListScreenState();
}

class _ExcursionsListScreenState extends State<ExcursionsListScreen> {
  final _excursionsListBloc = ExcursionsListBloc(
    GetIt.I<ExcursionsRepository>(),
  );

  @override
  void initState() {
    _excursionsListBloc.add(LoadExcursionsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(
            top: 22.0,
            left: 15.0,
          ),
          child: Text(
            'Экскурсии',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _excursionsListBloc.add(LoadExcursionsList(completer: completer));
          return completer.future;
        },
        child: BlocBuilder<ExcursionsListBloc, ExcursionsListState>(
          bloc: _excursionsListBloc,
          builder: (context, state) {
            if (state is ExcursionsListLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
                itemCount: state.excursionsList.length,
                itemBuilder: (context, i) {
                  return ExcursionTile(excursion: state.excursionsList[i]);
                },
              );
            }

            if (state is ExcursionsListError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Ошибка при получении данных'),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        _excursionsListBloc.add(LoadExcursionsList());
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
      ),
    );
  }
}
