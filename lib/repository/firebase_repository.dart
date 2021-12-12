abstract class FirebaseRepository{
  Future<String> putFile(String localFilePath);
  Future<void> delete(String url);
}