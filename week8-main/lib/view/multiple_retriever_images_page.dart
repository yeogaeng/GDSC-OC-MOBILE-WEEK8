import 'package:flutter/material.dart';
import 'package:week8/const/colors.dart';
import 'package:week8/const/text.dart';
import 'package:week8/layout/arrow_layout.dart';
import 'package:week8/services/api_service.dart';

class MultipleRetrieverImagesPage extends StatefulWidget {
  const MultipleRetrieverImagesPage({super.key});

  @override
  State<MultipleRetrieverImagesPage> createState() =>
      _MultipleRetrieverImagesPageState();
}

class _MultipleRetrieverImagesPageState
    extends State<MultipleRetrieverImagesPage> {
  late Future _fetchRetrieverImages;

  @override
  void initState() {
    super.initState();
    _fetchRetrieverImages = ApiService().multipleRetrieverImages();
  }

  @override
  Widget build(BuildContext context) {
    return ArrowLayout(
      appBarTitle: "랜덤 리트리버 사진",
      body: FutureBuilder(
        future: _fetchRetrieverImages,
        builder: (context, snapshot) {
          if (snapshot.connectionState.index != 3)
            return Center(child: CircularProgressIndicator());
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    snapshot.data[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
