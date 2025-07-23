import 'package:bildergalerie/logic/Widget/appbar.dart';
import 'package:bildergalerie/logic/Widget/foto_card.dart';
import 'package:bildergalerie/logic/classes/gallery_item.dart';
import 'package:bildergalerie/logic/style/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyGallery extends StatefulWidget {
  const MyGallery({super.key});

  @override
  State<MyGallery> createState() => _MyGalleryState();
}

class _MyGalleryState extends State<MyGallery> {
  /*  Ist GridView aktiv? */
  bool gridView = true;

  /*  Daten für die Galerie */
  final List<GalleryItem> galleryData = [
    GalleryItem(
      imageTitle: 'Bunter Basketball',
      imageDate: '03.07.2025',
      imageDescription:
          'Ein farbenfrohes Basketballfeld im Freien. Im Zentrum steht ein Basketballkorb, dessen weißes Netz im leichten Wind schaukelt. Die Farben des Spielfelds leuchten unter der warmen Abendsonne. Vor vielen Jahren, während eines Sommerabends, trafen sich hier Freunde zu einem unvergesslichen Spiel, bei dem die Sieger den Sonnenuntergang bejubelten.',
      imagePath: 'assets/images/basketball_1.jpeg',
    ),
    GalleryItem(
      imageTitle: 'Achtung Kurve',
      imageDate: '18.06.2022',
      imageDescription:
          'Eine große Gruppe Rennradfahrer legt sich synchron in eine scharfe Kurve, während sie mit beeindruckender Geschwindigkeit die Strecke entlangrasen. Die bunten Trikots der Fahrer leuchten im Sonnenschein, und ihre Konzentration ist greifbar. Vor einigen Jahren, während eines spannenden Wettkampfs an einem sonnigen Frühlingstag, markierte diese Kurve den Wendepunkt des Rennens und wurde zum Schauplatz eines packenden Duells um die Spitze.',
      imagePath: 'assets/images/bike.jpeg',
    ),
    GalleryItem(
      imageTitle: 'Runners High',
      imageDate: '22.09.2023',
      imageDescription:
          'Unsere acht Läufer bewegen sich hier in einer beeindruckenden Dreiecks-Formation über die Bahnen des sonnigen Sportplatzes am Mauerpark. Alle Athleten sind synchronisiert, ihre Schritte im perfekten Einklang, während sie die rote Tartanbahn unter ihren Füßen spüren. An einem kühlen Herbstmorgen, während eines intensiven Trainings, wurde diese Formation gewählt, um Teamarbeit und Präzision zu perfektionieren, und es war ein Moment, der die Entschlossenheit und den Zusammenhalt der Gruppe widerspiegelte.',
      imagePath: 'assets/images/running.jpeg',
    ),
    GalleryItem(
      imageTitle: 'Swish',
      imageDate: '11.08.2018',
      imageDescription:
          'Ein Foto, das von unten aufgenommen wurde, zeigt einen Basketballkorb mit einem strahlend blauen Himmel im Hintergrund. Die Sonne scheint hell, und das weiße Netz des Korbs hebt sich kontrastreich gegen das Blau ab. An einem klaren Sommernachmittag, vor vielen Jahren, wurde hier ein legendäres Spiel gespielt, bei dem der letzte Korb im goldenen Licht des Abends glänzte.',
      imagePath: 'assets/images/basketball_2.jpeg',
    ),
    GalleryItem(
      imageTitle: 'Ball Game',
      imageDate: '29.11.2023',
      imageDescription:
          'Die Nahaufnahme zeigt einen gelb-grünen Tennisball, der auf dem glänzenden Boden der Sporthalle liegt. Die Textur des Balls ist deutlich sichtbar, während das gedämpfte Licht der Halle eine ruhige Atmosphäre schafft. An einem regnerischen Nachmittag fand hier ein spannendes Match statt, bei dem dieser Ball im entscheidenden Moment des Spiels eine wichtige Rolle spielte.',
      imagePath: 'assets/images/tennis_1.jpeg',
    ),
    GalleryItem(
      imageTitle: 'Sieg in der Natur',
      imageDate: '02.05.2022',
      imageDescription:
          'Eine beeindruckende Drohnenaufnahme zeigt ein Tennisfeld, das idyllisch mitten im Grünen liegt. Das leuchtend grüne Spielfeld kontrastiert wunderschön mit den umgebenden Bäumen und Wiesen. An einem sonnigen Sommertag vor einigen Jahren wurde hier ein Turnier ausgetragen, bei dem Spieler und Zuschauer gleichermaßen die atemberaubende Naturkulisse genossen.',
      imagePath: 'assets/images/tennis_2.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final style = Provider.of<StyleManager>(context).style; //  StyleManager

    return Scaffold(
      backgroundColor: style.background,
      appBar: CustomAppBar(
        title: "MyGallery",
        navPage: false,
        view: true,
        isGridView: gridView, //  Status der Übersicht weitergeben
        onViewList: () => setState(() => gridView = false), // Setzen der
        onViewGrid: () => setState(() => gridView = true), // Gridview
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        /*  Animation für's Wechseln */
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: gridView
              // Zuverlässige Unterscheidung beider Widgets
              ? KeyedSubtree(
                  key: const ValueKey('grid'),
                  child: sightGridView(galleryData),
                )
              : KeyedSubtree(
                  key: const ValueKey('list'),
                  child: sightListView(galleryData),
                ),
        ),
      ),
    );
  }

  int calculateCrossAxisCount(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < 400) return 2; // kleines Handy
    if (width < 600) return 3; // normales Handy
    if (width < 800) return 4; // Tablet
    return 5; // Bildschirm
  }

  Widget sightGridView(List<GalleryItem> galleryData) {
    return GridView.builder(
      itemCount: galleryData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: calculateCrossAxisCount(context),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final item = galleryData[index];
        //  Button für Details  //
        return fotoCard(context, item, compact: false);
      },
    );
  }

  Widget sightListView(List<GalleryItem> galleryData) {
    return ListView.builder(
      itemCount: galleryData.length,
      itemBuilder: (context, index) {
        final item = galleryData[index];
        return fotoCard(context, item, compact: true);
      },
    );
  }
}
