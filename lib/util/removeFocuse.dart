import 'package:flutter/material.dart';

class RemoveFocuse extends StatelessWidget {
  final Widget child;
  final VoidCallback? onClick;
  const RemoveFocuse({Key? key, required this.child, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: child,
      onTap: onClick,
    );
  }
}
