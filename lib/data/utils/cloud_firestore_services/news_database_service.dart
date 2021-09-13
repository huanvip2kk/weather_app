import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

import '../../model/news/news_model.dart';

class NewsDBServices {
  final CollectionReference news =
      FirebaseFirestore.instance.collection("news");

  Future saveNews({required NewsModel newsModel}) async {
    try {
      await news.doc(newsModel.docID).set(
            newsModel.toJson(),
          );
      return true;
    } catch (e) {
      return false;
    }
  }

  Stream<List<NewsModel>> getListNews() =>
      news.orderBy("uploadTime", descending: true).snapshots().map((news) {
        return news.docs
            .map(
              (e) => NewsModel.fromJson(
                e.data() as Map<String, dynamic>,
              ),
            )
            .toList();
      });

  Future updateNews({
    required NewsModel newsModel,
  }) async {
    try {
      await news.doc(newsModel.docID).update(
            newsModel.toJson(),
          );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future getNews({
    required NewsModel newsModel,
  }) async {
    try {
      final data = await news.doc(newsModel.docID).get();
      return NewsModel.fromJson(data.data() as Map<String, dynamic>);
    } catch (e) {
      return false;
    }
  }

  Future uploadImages({
    required List<File> images,
    required NewsModel newsModel,
  }) async {
    final List<String> list = [];

    for (var img in images) {
      final ref = FirebaseStorage.instance
          .ref()
          .child('images/${path.basename(img.path)}');
      await ref.putFile(img).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          list.add(value);
          news.doc(newsModel.docID).update({'images': list});
        });
      });
    }
  }

  Future uploadThumbnails({
    required File thumbnailsUrl,
    required String docID,
  }) async {
    await FirebaseStorage.instance
        .ref("thumbnails/$docID")
        .putFile(
          File(thumbnailsUrl.path),
        )
        .snapshot
        .ref
        .getDownloadURL()
        .then(
      (value) {
        return news.doc(docID).update(
          {'thumbnails': value},
        );
      },
    );
  }

  Future deleteNews({required String docID}) async {
    try {
      await news.doc(docID).delete();
      await FirebaseStorage.instance.ref('thumbnails/$docID').delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  deleteAll() async {
    final get = await news.get();

    for (final doc in get.docs) {
      await doc.reference.delete();
    }
  }

  Future<void> newsAdd({
    required List<File> images,
    required String title,
    required String content,
    required File thumbnails,
    required String author,
    required String brief,
    required String docID,
  }) async {
    final List<String> list = [];

    list.add(
      images.toString(),
    );
    NewsModel newsModel = NewsModel(
      title: title,
      images: list,
      content: content,
      thumbnails: thumbnails.toString(),
      uploadTime: DateFormat('hh:mm a --- E,dd MM yyyy').format(
        DateTime.now(),
      ),
      author: author,
      brief: brief,
      docID: docID,
    );
    await saveNews(
      newsModel: newsModel,
    );
    await uploadThumbnails(
      thumbnailsUrl: thumbnails,
      docID: newsModel.docID,
    );
    await uploadImages(
      images: images,
      newsModel: newsModel,
    );
  }

  Future<void> newsUpdate({
    required String title,
    required String content,
    required List<File> images,
    File? thumbnails,
    String? thumbnailsLink,
    required String brief,
    required String uploadTime,
    required String docID,
  }) async {
    final List<String> list = [];

    list.add(
      images.toString(),
    );

    NewsModel newsModel = NewsModel(
      brief: brief,
      author: FirebaseAuth.instance.currentUser!.displayName!,
      uploadTime: uploadTime,
      content: content,
      thumbnails: thumbnails?.toString() ?? thumbnailsLink.toString(),
      title: title,
      images: list,
      docID: docID,
    );
    await updateNews(
      newsModel: newsModel,
    );
    await uploadImages(
      images: images,
      newsModel: newsModel,
    );

    if (thumbnails != null) {
      await uploadThumbnails(
        thumbnailsUrl: thumbnails,
        docID: newsModel.docID,
      );
    }
  }
}

final news = NewsDBServices();
