import 'package:flutter/material.dart';
import 'package:flutter_clock/util/utility.dart';

class CommonSearchBar extends StatefulWidget {
  final String? text;
  final TextEditingController? textEditingController;
  final bool enabled, isShow;
  final double height;
  final IconData? iconData;

  CommonSearchBar(
      {Key? key,
      this.text,
      this.textEditingController,
      this.enabled = false,
      this.isShow = true,
      this.height = 48,
      this.iconData})
      : super(key: key);

  @override
  State<CommonSearchBar> createState() => _CommonSearchBarState();
}

class _CommonSearchBarState extends State<CommonSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      child: Container(
        height: widget.height,
        child: Center(
          child: Row(
            children: [
              Icon(
                widget.iconData,
                size: 18,
                color: Color(purple),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                  child: TextField(
                controller: widget.textEditingController,
                maxLines: 1,
                enabled: widget.enabled,
                onChanged: (String txt) {},
                cursorColor: Color(purple),
                decoration: new InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  errorText: null,
                  border: InputBorder.none,
                  hintText: widget.text,
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
