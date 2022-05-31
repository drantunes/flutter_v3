import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class PhotosRepository extends ChangeNotifier {
  List<String> photos = [];
  List<String> photosThumbs = [];

  PhotosRepository();

  Future<List<String>> getAll() async {
    final url = Uri.parse('https://picsum.photos/v2/list?limit=60');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final photosList = jsonDecode(response.body) as List;

      for (var photo in photosList) {
        photos.add("https://picsum.photos/id/${photo['id']}/1280/780");
        photosThumbs.add("https://picsum.photos/id/${photo['id']}/160/120");
      }
    }
    notifyListeners();
    return photos;
  }
}
