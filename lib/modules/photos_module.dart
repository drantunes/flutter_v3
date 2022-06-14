import 'package:flutter/material.dart';
import 'package:flutter_v3/core/load_module.dart';
import 'package:flutter_v3/pages/photos_page.dart' deferred as photos_page;
import 'package:flutter_v3/repositories/photos_repository.dart';
import 'package:provider/provider.dart';

class PhotosModule extends StatelessWidget {
  const PhotosModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PhotosRepository>(
          create: (context) => PhotosRepository(),
        ),
      ],
      child: LoadModule(
        library: photos_page.loadLibrary(),
        module: () => photos_page.PhotosPage(),
      ),
    );
  }
}
