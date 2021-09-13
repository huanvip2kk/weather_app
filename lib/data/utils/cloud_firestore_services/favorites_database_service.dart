import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../model/favorites/favorites_model.dart';

class FavoritesDBServices {
  final CollectionReference favorite =
      FirebaseFirestore.instance.collection("favorites");


  Future saveFav({required FavoritesModel favoritesModel,required String uid}) async {
    try {
      await favorite.doc('${favoritesModel.locationName} - $uid').set(
            favoritesModel.toJson(),
          );
      return true;
    } catch (e) {
      return false;
    }
  }

  Stream<List<FavoritesModel>> getFav({required String uid}) =>
      favorite.where("uid", isEqualTo: uid).snapshots().map((fav) {
        return fav.docs
            .map(
              (e) => FavoritesModel.fromJson(
                e.data() as Map<String, dynamic>,
              ),
            )
            .toList();
      });

  Future deleteFav(String id) async {
    try {
      await favorite.doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future updateFav({required FavoritesModel favoritesModel,required String uid}) async {
    try {
      await favorite.doc('${favoritesModel.locationName} - $uid').update(
            favoritesModel.toJson(),
          );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> favoriteUpdate({
    required String locationName,
    required bool favorite,
    required int woeid,
    required String docID,
    required String uid,
  }) async {
    final FavoritesModel favoritesModel = FavoritesModel(
      locationName: locationName,
      favorite: favorite,
      uid: FirebaseAuth.instance.currentUser!.uid,
      woeid: woeid,
      docID: docID,
    );
    await updateFav(
      uid: uid,
      favoritesModel: favoritesModel,
    );
  }

  Future<void> favoriteAdd({
    required String locationName,
    required bool favorites,
    required int woeid,
    required String docID,
    required String uid,
  }) async {
    final query = favorite
        .where(
          'docID',
          isEqualTo: docID,
        );
    final get = await query.get();
    if (get.docs.isEmpty) {
      final FavoritesModel favoritesModel = FavoritesModel(
        locationName: locationName,
        uid: uid,
        favorite: favorites,
        woeid: woeid,
        docID: docID,
      );
      await saveFav(
        uid: uid,
        favoritesModel: favoritesModel,
      );
    }
  }
}

final favorite = FavoritesDBServices();
