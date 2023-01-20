import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Avatar extends StatefulWidget {
  String avatar;
  Avatar({Key? key, required this.avatar}) : super(key: key);

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.avatar != ""
          ? CircleAvatar(backgroundImage: NetworkImage(widget.avatar!))
          : FaIcon(FontAwesomeIcons.image),
    );
  }
}
