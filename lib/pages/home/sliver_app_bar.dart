import 'package:flutter/material.dart';

class sliver_appbar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;

  sliver_appbar(this._scaffoldKey);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(

        expandedHeight: 150.0,
        flexibleSpace: const FlexibleSpaceBar(
          title: Text('Available seats'),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_circle),
            tooltip: 'Add new entry',
            onPressed: () {
              /* ... */
            },
          ),
        ]);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
