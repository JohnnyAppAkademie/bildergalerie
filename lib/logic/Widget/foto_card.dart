import 'package:bildergalerie/logic/classes/gallery_item.dart';
import 'package:bildergalerie/logic/style/style_manager.dart';
import 'package:bildergalerie/pages/details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget fotoCard(
  BuildContext context,
  GalleryItem item, {
  bool compact = false,
}) {
  final style = Provider.of<StyleManager>(context).style;

  return Padding(
    padding: const EdgeInsets.only(bottom: 6.0),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: style.fotoCardColor,
        foregroundColor: Colors.black,
        padding: EdgeInsets.zero,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyDetails(galleryItem: item)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: compact
            ? Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      item.imagePath,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      item.imageTitle,
                      style: style.labelTitle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.asset(item.imagePath, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: Text(
                      item.imageTitle,
                      textAlign: TextAlign.center,
                      style: style.textButton,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
      ),
    ),
  );
}
