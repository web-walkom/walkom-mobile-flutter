import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
// import 'package:sceneview_flutter/sceneview_flutter.dart';

@RoutePage()
class CameraARScreen extends StatefulWidget {
  const CameraARScreen({
    super.key,
  });

  @override
  State<CameraARScreen> createState() => _CameraARScreenState();
}

class _CameraARScreenState extends State<CameraARScreen> {
  late ArCoreController arCoreController;

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }

  _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;

    _addCube(arCoreController);
  }

  void _addCube(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: Color(0xFF2AA057),
      metallic: 1.0,
    );
    final cube = ArCoreCube(
      materials: [material],
      size: vector.Vector3(0.5, 0.5, 0.5),
    );
    final node = ArCoreNode(
      shape: cube,
      position: vector.Vector3(0, 0, -1.5),
    );
    controller.addArCoreNode(node);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ArCoreView(
        onArCoreViewCreated: _onArCoreViewCreated,
      ),
    );
  }

  // SceneViewController _controller = SceneViewController();

  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(const Duration(seconds: 1)).then((value) {
  //     if (!mounted) return;

  //     _controller.displayDemo();
  //   });
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.white,
  //     body: SceneView(_controller),
  //   );
  // }
}
