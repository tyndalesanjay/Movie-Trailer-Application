import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

class AppSearchBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  AppSearchBar({Key? key, required this.preferredSize}) : super(key: key);
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: Border(
        bottom: BorderSide(width: 3.0, color: Colors.red),
      ),
      backgroundColor: Colors.black,
      actions: [
        AnimSearchBar(
          textController: textController,
          color: Colors.black,
          width: 400,
          animationDurationInMilli: 1000,
          rtl: true,
          helpText: 'Search Movies....',
          style: TextStyle(color: Colors.white),
          suffixIcon: Icon(
            Icons.search_outlined,
            color: Colors.redAccent,
          ),
          closeSearchOnSuffixTap: true,
          onSuffixTap: () {
            // setState(() {
            //   textController.clear();
            // });
          },
        )
      ],
    );
  }
}
