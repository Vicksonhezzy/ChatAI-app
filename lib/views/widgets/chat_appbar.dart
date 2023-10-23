import 'package:flutter/material.dart';
import 'package:testai/main.dart';

import '../../core/app_export.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    bool isMobile = size.width <= 600;
    final textTheme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: getVerticalSize(70.00),
      decoration: BoxDecoration(
        color: isDark ? Colors.white70 : ColorConstant.whiteA700,
      ),
      child: Padding(
        padding: getPadding(left: 10, top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: !isMobile ? getHorizontalSize(8) : null,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      drawer(),
                      drawer(),
                      drawer(),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getPadding(left: 15),
                      child: Text(
                        "Real Assist AI".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w700, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: getPadding(left: 15),
                      child: Text(
                        "This is private message between you and Assist".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: textTheme.labelSmall!
                            .copyWith(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  if (isDark) {
                    themeMode.value = ThemeMode.light;
                  } else {
                    themeMode.value = ThemeMode.dark;
                  }
                },
                // iconSize: getSize(20),
                icon: Icon(
                  isDark ? Icons.light_mode_outlined : Icons.dark_mode,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget drawer() {
    bool isMobile = size.width <= 600;
    return Container(
      height: getVerticalSize(2.00),
      width: getHorizontalSize(isMobile ? 20.00 : 10),
      margin: getMargin(top: 2, bottom: 2),
      color: Colors.black,
    );
  }
}
