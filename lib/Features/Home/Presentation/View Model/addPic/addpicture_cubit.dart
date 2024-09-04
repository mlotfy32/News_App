import 'dart:io';
import 'dart:math';
import 'package:news_app/main.dart';
import 'package:path/path.dart';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:news_app/Core/Utiles/constans.dart';

part 'addpicture_state.dart';

class AddpictureCubit extends Cubit<AddpictureState> {
  AddpictureCubit() : super(AddpictureInitial());
  addPicture({required bool camera}) async {
    File? _image;
    var picked;
    var imagename;
    var imageurl;
    try {
      picked = await ImagePicker().pickImage(
          source: camera == true ? ImageSource.camera : ImageSource.gallery);
      if (picked != null) {
        var userId = FirebaseAuth.instance.currentUser!.uid;
        _image = File(picked.path);
        var randome = Random().nextInt(1000000);
        imagename = '$randome' + basename(picked.path);
        Reference ref =
            FirebaseStorage.instance.ref('profile').child('$imagename');
        await ref.putFile(_image!);
        imageurl = await ref.getDownloadURL();
        var randome2 = Random().nextInt(1000000);
        var unikRandome = '$randome2' + basename('Unik');
        Constans.collectionReference.add({
          'userId': userId,
          'profilePic': '$imageurl',
        });
        await profilePic!.setString('Url', '$imageurl');
        emit(AddpictureSuccess(Url: imageurl));
      }
    } catch (e) {
      emit(AddpictureFailure());
    }
  }
}
