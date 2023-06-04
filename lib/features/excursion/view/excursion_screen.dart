import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';
import 'package:walkom_mobile_flutter/features/excursion/bloc/excursion_bloc.dart';
import 'package:walkom_mobile_flutter/features/excursion/widgets/widgets.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/excursions.dart';
import 'package:walkom_mobile_flutter/router/router.dart';
import 'package:walkom_mobile_flutter/widgets/button.dart';
import 'package:walkom_mobile_flutter/widgets/error_load.dart';
import 'package:walkom_mobile_flutter/widgets/loader.dart';

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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<ExcursionBloc, ExcursionState>(
          bloc: _excursionBloc,
          builder: (context, state) {
            return Stack(
              children: [
                const Positioned(
                  top: 50,
                  left: 25,
                  right: 25,
                  child: ActionsHeader(),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  child: Ink.image(
                    image: NetworkImage(widget.excursion.photos[0]),
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 55 / 100,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 55 / 100 - 40,
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 25.0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 45 / 100 - 35,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(45.0)),
                    ),
                    child: Column(children: [
                      SelectableText(
                        widget.excursion.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Expanded(
                        child: (state is ExcursionLoaded)
                            ? SelectableText(
                                state.excursion.description,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              )
                            : (state is ExcursionError)
                                ? ErrorLoad(tryAgain: () {
                                    _excursionBloc.add(LoadExcursion(
                                        excursionId: widget.excursion.id));
                                  })
                                : const Loader(),
                      )
                    ]),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 30,
                  right: 30,
                  child: MainButton(
                    title: BUTTON_RUN_EXCURSION,
                    pressedFunc: () {
                      AutoRouter.of(context).push(const MapRoute());
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
