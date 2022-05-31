import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PhotoPage extends StatelessWidget {
  final String photo;
  final String tag;
  const PhotoPage({
    Key? key,
    required this.photo,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Hero(
          tag: tag,
          child: Image(
            image: CachedNetworkImageProvider(
              photo,
            ),
          ),
        ),
      ),
    );
  }
}
