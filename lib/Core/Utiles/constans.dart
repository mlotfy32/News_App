import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Constans {
  static String KBox = 'favorite_news';
  static String KHiveFavorite = 'fetch_favorite_news';
  static CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('ProfilePic');
}
