// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:testai/core/app_export.dart';
import 'package:testai/views/widgets/settings/settings_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: size.width / 4.5,
      padding: getPadding(top: 10),
      color: isDark ? Colors.white70 : Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: getMargin(left: 3, bottom: 30),
            child: Text(
              'Recent Chats',
              style: textTheme.titleSmall!
                  .copyWith(fontWeight: FontWeight.w700, color: Colors.black),
            ),
          ),
          ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return RecentChatBuilder();
            },
          ),
        ],
      ),
    );
  }
}
