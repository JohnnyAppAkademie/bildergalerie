import 'package:flutter/material.dart';
/*
class AppStyle {
  static const Color lightText = Colors.white;
  static const Color darkText = Colors.black;

  final Color background;
  final Color label;
  final Color navBarSelect;
  final Color fotoCardColor;
  final Color textBox;
  final Color navBarIcon;

  final TextStyle title;
  final TextStyle labelTitle;
  final TextStyle textBasis;
  final TextStyle textItalic;
  final TextStyle headFotoCard;
  final TextStyle textButton;
  final TextStyle navButton;

  const AppStyle._({
    /*  Color */
    required this.background,
    required this.label,
    required this.fotoCardColor,
    required this.navBarSelect,
    required this.navBarIcon,
    required this.textBox,
    /*  Text Style */
    required this.title,
    required this.labelTitle,
    required this.textBasis,
    required this.textItalic,
    required this.headFotoCard,
    required this.textButton,
    required this.navButton,
  });

  /// Factory für Light Mode
  factory AppStyle.light() {
    return const AppStyle._(
      /*  Scaffhold Hintergrund */
      background: Color.fromARGB(255, 240, 199, 199),
      /*  AppBar, NavBar Hintergrund */
      label: Color.fromARGB(255, 100, 16, 16),
      /*  Foto Card - Hintergrund */
      fotoCardColor: Color.fromARGB(255, 100, 16, 16),
      /*  Navigation ( Selected Page Hintergrund )  */
      navBarSelect: Color.fromARGB(255, 240, 199, 199),
      /*  Navigation ( Icon )  */
      navBarIcon: Color.fromARGB(192, 211, 25, 140),
      /*  Text-Container ( Hintergrund )  */
      textBox: Color.fromARGB(139, 100, 16, 16),

      /*  Text Style  - Titel */
      title: TextStyle(
        fontSize: 20,
        color: lightText,
        fontWeight: FontWeight.bold,
      ),

      /*  Text Style  - AppBar-Titel */
      labelTitle: TextStyle(
        fontSize: 20,
        color: lightText,
        fontWeight: FontWeight.bold,
      ),

      /* Text Style - Text Container  */
      textBasis: TextStyle(fontSize: 14, color: lightText),
      textItalic: TextStyle(
        fontSize: 12,
        color: lightText,
        fontVariations: [FontVariation.italic(1.0)],
      ),

      /* Text Style - Foto Card */
      headFotoCard: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: lightText,
      ),

      /* Text Style - Text Button */
      textButton: TextStyle(fontSize: 16, color: lightText),

      /* Text Style - Nav Button */
      navButton: TextStyle(fontSize: 14, color: lightText),
    );
  }

  /// Factory für Dark Mode
  factory AppStyle.dark() {
    return const AppStyle._(
      /*  Color */
      background: Color.fromARGB(244, 1, 6, 29),
      label: Color.fromARGB(57, 14, 93, 212),
      fotoCardColor: Color.fromARGB(123, 10, 75, 173),
      navBarSelect: Color.fromARGB(244, 1, 6, 29),
      navBarIcon: Color.fromARGB(192, 255, 255, 255),
      textBox: Color.fromARGB(66, 10, 75, 173),

      /*  Text Style */
      title: TextStyle(
        fontSize: 20,
        color: lightText,
        fontWeight: FontWeight.bold,
      ),
      labelTitle: TextStyle(
        fontSize: 20,
        color: lightText,
        fontWeight: FontWeight.bold,
      ),
      textBasis: TextStyle(fontSize: 14, color: lightText),
      textItalic: TextStyle(
        fontSize: 12,
        color: lightText,
        fontVariations: [FontVariation.italic(1.0)],
      ),
      headFotoCard: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: lightText,
      ),
      textButton: TextStyle(fontSize: 16, color: lightText),

      /* Text Style - Nav Button */
      navButton: TextStyle(fontSize: 14, color: lightText),
    );
  }
}
*/

class AppStyle {
  final Color lightText = Colors.white;
  final Color darkText = Colors.black;

  final bool isLight;

  final Color background;
  final Color label;
  final Color navBarSelect;
  final Color fotoCardColor;
  final Color textBox;
  final Color navBarIcon;

  late final Color textColor;

  AppStyle._({
    required this.isLight,
    required this.background,
    required this.label,
    required this.navBarSelect,
    required this.fotoCardColor,
    required this.textBox,
    required this.navBarIcon,
  }) {
    textColor = lightText;
  }

  factory AppStyle.light() {
    return AppStyle._(
      /*  LColor - Light ModeFlag  */
      isLight: true,

      /*  LColor - Hintergrund */
      background: const Color.fromARGB(255, 226, 162, 162),

      /*  LColor - Navbar  / Appbar */
      label: const Color.fromARGB(255, 129, 19, 19),

      /*  LColor - Foto Card  - Hintergrund */
      fotoCardColor: const Color.fromARGB(255, 228, 82, 82),

      /*  LColor - Navigation ( Selected Page Hintergrund )  */
      navBarSelect: const Color.fromARGB(255, 228, 82, 82),

      /*  LColor - Navigation ( Icon )  */
      navBarIcon: const Color.fromARGB(255, 255, 255, 255),

      /*  LColor - Text-Container ( Hintergrund )  */
      textBox: const Color.fromARGB(186, 100, 16, 16),
    );
  }

  factory AppStyle.dark() {
    return AppStyle._(
      /*  DColor - Dark ModeFlag  */
      isLight: false,

      /*  DColor - Hintergrund */
      background: const Color.fromARGB(244, 1, 6, 29),

      /*  DColor - Navbar  / Appbar */
      label: const Color.fromARGB(57, 14, 93, 212),

      /*  DColor - Foto Card  - Hintergrund */
      fotoCardColor: const Color.fromARGB(123, 10, 75, 173),

      /*  DColor - Navigation ( Selected Page Hintergrund )  */
      navBarSelect: const Color.fromARGB(244, 1, 6, 29),

      /*  DColor - Navigation ( Icon )  */
      navBarIcon: const Color.fromARGB(192, 255, 255, 255),

      /*  DColor - Text-Container ( Hintergrund )  */
      textBox: const Color.fromARGB(66, 10, 75, 173),
    );
  }

  // TextStyle für die verschiedenen Elemente //

  /* Design für den Titel der Gallerie-Bilder  */
  TextStyle get title =>
      TextStyle(fontSize: 20, color: lightText, fontWeight: FontWeight.bold);

  /* Design für den Titel der Appbar */
  TextStyle get labelTitle =>
      TextStyle(fontSize: 20, color: textColor, fontWeight: FontWeight.bold);

  /*  Design für die Titel Texte  */
  TextStyle get textTitle => TextStyle(fontSize: 18, color: textColor);

  /*  Design für die Texte  */
  TextStyle get textBasis => TextStyle(fontSize: 14, color: textColor);

  /*  Design für die krusiven Texte  */
  TextStyle get textItalic =>
      TextStyle(fontSize: 15, color: textColor, fontStyle: FontStyle.italic);

  /*  Design für die Gallerie - Button Texte*/
  TextStyle get textButton =>
      TextStyle(fontSize: 16, color: textColor, fontStyle: FontStyle.italic);

  TextStyle get navButton => TextStyle(fontSize: 14, color: textColor);
}
