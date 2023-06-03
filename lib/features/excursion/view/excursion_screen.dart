import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<ExcursionBloc, ExcursionState>(
          bloc: _excursionBloc,
          builder: (context, state) {
            return Stack(
              children: [
                Positioned(
                  top: 45,
                  left: 25,
                  right: 25,
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
                          icon: const Icon(Icons.arrow_back_ios_new_rounded),
                          color: Colors.white,
                          style: IconButton.styleFrom(
                            backgroundColor: blackTransparent,
                          ),
                        ),
                      ),
                      Ink(
                        width: 45,
                        height: 45,
                        child: IconButton(
                          onPressed: () {
                            __actionsExcursion(context);
                          },
                          icon: const Icon(Icons.more_vert_rounded),
                          color: Colors.white,
                          style: IconButton.styleFrom(
                            backgroundColor: blackTransparent,
                          ),
                        ),
                      )
                    ],
                  ),
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
                              ? Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text('Ошибка при получении данных'),
                                      TextButton(
                                        onPressed: () {
                                          _excursionBloc.add(LoadExcursion(
                                              excursionId:
                                                  widget.excursion.id));
                                        },
                                        child: const Text('Попробвать снова'),
                                      )
                                    ],
                                  ),
                                )
                              : const Expanded(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        color: Colors.black,
                                        strokeWidth: 1.5,
                                      ),
                                    ),
                                  ),
                                ),
                    ]),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 30,
                  right: 30,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: buttonPrimary,
                    child: const Text("Запустить"),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  __actionsExcursion(context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
      builder: (BuildContext c) {
        return SizedBox(
          height: 140,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 15),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  contentPadding: EdgeInsets.only(left: 20, right: 20),
                  leading: Icon(Icons.bookmark_rounded),
                  title: Text("Добавить в избранное"),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  contentPadding: EdgeInsets.only(left: 20, right: 20),
                  leading: Icon(Icons.delete_rounded),
                  title: Text("Удалить файлы экскурсии"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  __actionsExcursionRounded(context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(45))),
      builder: (BuildContext c) {
        return Container(
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 25, left: 30, right: 30),
                child: Text(
                  "Выберите действие",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  contentPadding: EdgeInsets.only(left: 30, right: 30),
                  leading: Icon(Icons.bookmark_rounded),
                  title: Text("Добавить в избранное"),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  contentPadding: EdgeInsets.only(left: 30, right: 30),
                  leading: Icon(Icons.delete_rounded),
                  title: Text("Удалить файлы экскурсии"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
