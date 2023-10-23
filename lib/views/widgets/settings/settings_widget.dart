import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

// ignore: must_be_immutable
class RecentChatBuilder extends StatelessWidget {
  RecentChatBuilder({Key? key}) : super(key: key);

  FocusNode focusNode = FocusNode();
  Rx<bool> showDropDown = false.obs;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    // DevicePlatform platform = getPlatform(size.width);
    final textTheme = Theme.of(context).textTheme;
    // final isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(
      () => Container(
        color: showDropDown.value ? Colors.white70 : null,
        child: Focus(
          onFocusChange: (value) {
            showDropDown.value = value;
          },
          focusNode: focusNode,
          child: InkWell(
            onTap: () {
              if (!focusNode.hasFocus) {
                FocusScope.of(context).requestFocus(focusNode);
              } else {
                focusNode.unfocus();
              }
            },
            child: Stack(
              children: [
                Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Clause for renters best interest for a rental property',
                        style: textTheme.labelSmall!.copyWith(
                            fontWeight: FontWeight.w500, color: Colors.black),
                      ),
                    ),
                    Divider(color: Colors.grey.shade200)
                  ],
                ),
                if (showDropDown.value)
                  Positioned(
                    right: 0,
                    top: 10,
                    child: Container(
                      color: Colors.white,
                      padding: getPadding(top: 3, bottom: 10, left: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.edit_note,
                                size: 12,
                                color: Colors.black54,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Edit Tile',
                                  style: textTheme.labelSmall!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: getFontSize(10)),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.delete_forever,
                                color: Colors.red,
                                size: 12,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Delete Tile',
                                  style: textTheme.labelSmall!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red,
                                      fontSize: getFontSize(10)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
