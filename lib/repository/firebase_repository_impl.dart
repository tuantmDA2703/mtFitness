import 'dart:io';

import 'package:mt_fitness/base/utilities.dart';
import 'package:mt_fitness/config/app_config.dart';
import 'package:mt_fitness/repository/firebase_repository.dart';
import 'package:mt_fitness/service/firebase_service.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseRepositoryImpl extends FirebaseRepository with Utility{
  var storage = GetIt.I<FirebaseService>().firebaseStorage;
  @override
  Future<String> putFile(String localFilePath) async{
    File file = File(localFilePath);
    try{
      UploadTask uploadTask = FirebaseStorage.instance
          .ref('quick_access/file-to-upload.png')
          .putFile(file);
      String url = await (await uploadTask).ref.getDownloadURL();
      return url;
    }on FirebaseException catch (e) {
      printData(AppConfig.result,e.toString());
      return AppConfig.none;
    }
  }

  @override
  Future<void> delete(String url) async {
    await storage.refFromURL(url).delete();
  }

}