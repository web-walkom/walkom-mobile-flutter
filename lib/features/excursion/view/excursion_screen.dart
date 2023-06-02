import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:walkom_mobile_flutter/features/excursion/bloc/excursion_bloc.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/excursions.dart';
import 'package:walkom_mobile_flutter/styles/button.dart';
import 'package:walkom_mobile_flutter/styles/color.dart';

@RoutePage()
class ExcursionScreen extends StatefulWidget {
  const ExcursionScreen({
    super.key,
    required this.excursion,
  });

  final Excursion excursion;

  @override
  State<ExcursionScreen> createState() => _ExcursionScreenState();
}

class _ExcursionScreenState extends State<ExcursionScreen> {
  final _excursionBloc = ExcursionBloc(
    GetIt.I<ExcursionsRepository>(),
  );

  @override
  void initState() {
    _excursionBloc.add(LoadExcursion(excursionId: widget.excursion.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ExcursionBloc, ExcursionState>(
        bloc: _excursionBloc,
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 45.0, left: 25.0, right: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Ink(
                            width: 45,
                            height: 45,
                            child: IconButton(
                              onPressed: () {
                                AutoRouter.of(context).pop();
                              },
                              icon:
                                  const Icon(Icons.arrow_back_ios_new_rounded),
                              color: Colors.white,
                              style: IconButton.styleFrom(
                                  backgroundColor: blackTransparent),
                            ),
                          ),
                          Ink(
                            width: 45,
                            height: 45,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.more_vert_rounded),
                              color: Colors.white,
                              style: IconButton.styleFrom(
                                  backgroundColor: blackTransparent),
                            ),
                          )
                        ],
                      ),
                    ),
                    Ink.image(
                      image: NetworkImage(widget.excursion.photos[0]),
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Transform.translate(
                  offset: const Offset(0.0, -35.0),
                  child: Container(
                    // transform: Matrix4.translationValues(0.0, -35.0, 0.0),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(40.0))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 30.0, top: 25.0, bottom: 15.0),
                      child: Expanded(
                        child: Column(
                          children: [
                            Text(
                              widget.excursion.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 15),
                            (state is ExcursionLoaded)
                                ? Text(
                                    state.excursion.description,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  )
                                : (state is ExcursionError)
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                              'Ошибка при получении данных'),
                                          const SizedBox(height: 10),
                                          TextButton(
                                            onPressed: () {
                                              _excursionBloc.add(LoadExcursion(
                                                  excursionId:
                                                      widget.excursion.id));
                                            },
                                            child:
                                                const Text('Попробвать снова'),
                                          )
                                        ],
                                      )
                                    : const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          color: Colors.black,
                                          strokeWidth: 1.5,
                                        ),
                                      ),
                            Expanded(
                              child: Align(
                                alignment: FractionalOffset.bottomCenter,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: buttonPrimary,
                                  child: const Text("Запустить"),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
