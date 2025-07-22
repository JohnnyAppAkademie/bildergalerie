import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.navPage,
    required this.view,
    this.onViewList,
    this.onViewGrid,
  });

  final String title;
  final bool navPage;
  final bool view;
  final VoidCallback? onViewList;
  final VoidCallback? onViewGrid;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: navPage
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null,
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 30),
      ),
      actions: view
          ? [
              IconButton(
                onPressed: onViewList,
                icon: const Icon(Icons.list, color: Colors.white),
              ),
              IconButton(
                onPressed: onViewGrid,
                icon: const Icon(Icons.grid_view, color: Colors.white),
              ),
            ]
          : null,
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 100, 16, 16),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
