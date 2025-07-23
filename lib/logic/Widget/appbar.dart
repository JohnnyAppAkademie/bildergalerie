import 'package:bildergalerie/logic/style/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.navPage,
    required this.view,
    this.isGridView = true,
    this.onViewList,
    this.onViewGrid,
  });

  /*  AppBar Title  */
  final String title;
  /*  Stack-Navigation? */
  final bool navPage;
  /*  View-Change? */
  final bool view;
  final bool isGridView;
  final VoidCallback? onViewList;
  final VoidCallback? onViewGrid;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    /*  Notwendige Differenzierung von Manager und Manager-Style */
    final styleManager = Provider.of<StyleManager>(context);
    final style = styleManager.style;

    return AppBar(
      /*  Stack-Navigation */
      leading: navPage
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context, true),
            )
          : null,
      /*  Title   */
      title: Text(title, style: style.labelTitle),
      backgroundColor: style.label,
      centerTitle: true,
      actions: [
        /*  Dark / Light Mode */
        IconButton(
          tooltip: styleManager.isLight ? 'Dunkelmodus' : 'Hellmodus',
          onPressed: styleManager.toggleTheme, //  Switch Themes
          icon: Icon(
            styleManager.isLight ? Icons.light_mode : Icons.dark_mode,
            color: Colors.white,
          ),
        ),
        /*  Grid / List View */
        if (view)
          IconButton(
            tooltip: isGridView ? 'Listenansicht' : 'Gridansicht',
            onPressed: isGridView
                ? onViewList
                : onViewGrid, //  wird in Gallery übergeben
            icon: Icon(
              isGridView ? Icons.list : Icons.grid_view,
              color: Colors.white,
            ),
          ),
      ],
    );
  }
}
