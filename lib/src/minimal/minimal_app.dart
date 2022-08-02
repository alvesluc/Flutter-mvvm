import 'package:flutter/material.dart';

import 'view/minimal_view.dart';

class MinimalApp extends StatelessWidget {
  const MinimalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MinimalView(),
    );
  }
}
