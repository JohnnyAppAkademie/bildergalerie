import 'package:bildergalerie/logic/Widget/appbar.dart';
import 'package:bildergalerie/logic/classes/gallery_item.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 199, 199),
      appBar: CustomAppBar(title: "Detail", navPage: true, view: false),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: Image.asset(galleryItem.imagePath, fit: BoxFit.cover),
              ),
              Text(
                galleryItem.imageTitle,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                galleryItem.imageDate,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                  fontVariations: [FontVariation.italic(1.0)],
                ),
                textAlign: TextAlign.left,
              ),
              Expanded(
                child: Scrollbar(
                  controller: _scrollController,
                  thumbVisibility: false,
                  radius: const Radius.circular(10),
                  thickness: 8,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      galleryItem.imageDescription,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
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
