import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mt_fitness/config/app_route.dart';
import 'package:mt_fitness/service/navigator_service.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('OnBoard'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GetIt.I<NavigatorService>().pushed(AppRoute.yogaClassify);
        },
        child: const Icon(Icons.navigate_next_outlined),
      ),
    );
  }
}
