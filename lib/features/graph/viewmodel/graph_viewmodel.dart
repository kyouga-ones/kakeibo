import 'package:flutter/material.dart';
import 'package:kakeibo/features/graph/view/graph_screen.dart';

class GraphViewmodel extends StatefulWidget {
  const GraphViewmodel({super.key});

  @override
  State<GraphViewmodel> createState() => _GraphViewmodelState();
}

class _GraphViewmodelState extends State<GraphViewmodel> {
  @override
  Widget build(BuildContext context) {
    return GraphScreen();
  }
}
