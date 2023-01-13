import 'package:flutter/material.dart';

class CircularProgressIndicatorWidget extends StatefulWidget {
  const CircularProgressIndicatorWidget({Key? key}) : super(key: key);

  @override
  State<CircularProgressIndicatorWidget> createState() => _CircularProgressIndicatorState();
}

class _CircularProgressIndicatorState extends State<CircularProgressIndicatorWidget> {
  late bool _loading;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading=true;
  }
  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      strokeWidth: 10,
      backgroundColor: Colors.red,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
    );
  }
}
