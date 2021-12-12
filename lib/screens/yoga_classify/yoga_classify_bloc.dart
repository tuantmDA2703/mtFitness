import 'package:mt_fitness/base/bloc_base.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mt_fitness/config/app_config.dart';
import 'package:mt_fitness/repository/firebase_repository_impl.dart';
import 'package:mt_fitness/repository/yoga_pose_repository_impl.dart';
import 'package:mt_fitness/response/classify_reponse.dart';
import 'package:rxdart/rxdart.dart';
import 'package:get_it/get_it.dart';

class YogaClassifyBloc extends BlocBase {
  @override
  void dispose() {
    isPickedStatus.close();
  }

  final ImagePicker imagePicker = ImagePicker();

  BehaviorSubject<String> isPickedStatus =
      BehaviorSubject.seeded(AppConfig.none);

  Sink<String> get pickedStatusSink => isPickedStatus.sink;

  Stream<String> get pickedStatusStream => isPickedStatus.stream;

  var yogaPoseRepository = GetIt.I<YogaPoseRepositoryImpl>();
  var firebaseRepository = GetIt.I<FirebaseRepositoryImpl>();
  pickImage() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pickedStatusSink.add(pickedFile.path);
      String imgUrl = await firebaseRepository.putFile(pickedFile.path);
      printData(AppConfig.result, imgUrl);
      if(imgUrl!=AppConfig.none){
        ClassifyResponse? response = await yogaPoseRepository.requestClassify(imgUrl);
        if(response!=null){
          printData(AppConfig.result, response.labelName);
          await firebaseRepository.delete(imgUrl);
        }else{
          printData(AppConfig.result, AppConfig.none);
        }
      }
    } else {
      snackBar.showUnsuccessful('You haven\'t picked image yet');
    }
  }
}
