import 'package:bildergalerie/logic/Widget/appbar.dart';
import 'package:bildergalerie/logic/Widget/text_container.dart';
import 'package:bildergalerie/logic/classes/gallery_item.dart';
import 'package:bildergalerie/logic/style/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDetails extends StatefulWidget {
  const MyDetails({super.key, required this.galleryItem});

  final GalleryItem galleryItem;

  @override
  State<MyDetails> createState() => _MyDetailsState();
}

class _MyDetailsState extends State<MyDetails> {
  final ScrollController _scrollController = ScrollController();
  late GalleryItem galleryItem;

  @override
  void initState() {
    super.initState();
    galleryItem = widget.galleryItem;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = Provider.of<StyleManager>(context).style;

    return Scaffold(
      backgroundColor: style.background,
      //  Nav-Bar für's Pop ( siehe appbar.dart )
      appBar: CustomAppBar(title: "Detail", navPage: true, view: false),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /*  Bild  */
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: Image.asset(galleryItem.imagePath, fit: BoxFit.cover),
              ),
              /*  Beschreibung  */
              Expanded(
                child: Scrollbar(
                  controller: _scrollController,
                  thumbVisibility: false,
                  radius: const Radius.circular(10),
                  thickness: 8,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(10),
                    // ( siehe text_container.dart )
                    child: TextContainer(
                      text: galleryItem.imageDescription,
                      textTitle: galleryItem.imageTitle,
                      textDate: galleryItem.imageDate,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
