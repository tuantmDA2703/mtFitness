import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('OnBoard'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: const Icon(Icons.navigate_next_outlined),
      ),
    );
  }
}
