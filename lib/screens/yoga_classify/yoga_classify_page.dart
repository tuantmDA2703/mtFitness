import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mt_fitness/config/app_config.dart';
import 'package:mt_fitness/config/app_spacing.dart';
import 'package:mt_fitness/screens/yoga_classify/yoga_classify_bloc.dart';

class YogaPoseClassifyPage extends StatelessWidget {
  const YogaPoseClassifyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = YogaClassifyBloc();
    return Scaffold(
      body: SizedBox(
        height: AppSpacing().getHeight(context),
        width: AppSpacing().getWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<String>(
                stream: bloc.pickedStatusStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const SizedBox();
                  } else {
                    String imagePath = snapshot.data!;
                    return imagePath == AppConfig.none
                        ? const SizedBox()
                        : Image.file(File(imagePath));
                  }
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await bloc.pickImage();
        },
        child: const Icon(Icons.image),
      ),
    );
  }
}
