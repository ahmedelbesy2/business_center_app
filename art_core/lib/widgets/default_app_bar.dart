import 'package:art_core/art_core.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  dynamic title;
  final bool? centerTitle;
  final VoidCallback? onBack;
  final Widget? leadingWidgets;
  final bool? ishidenIcon;
  final Color? color;

  DefaultAppBar({
    Key? key,
    this.title,
    this.centerTitle,
    this.onBack,
    this.leadingWidgets,
    this.ishidenIcon,
    this.color,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: title,
        backgroundColor: color??colorWhite,
        automaticallyImplyLeading:ishidenIcon==false ?true:false,
        centerTitle: true,
        elevation: 0,

        leading:ishidenIcon==false? leadingWidgets: IconButton(
          onPressed: onBack ??
              () {
                Modular.to.pop();
              },
          icon: Icon(Icons.adaptive.arrow_back),
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
