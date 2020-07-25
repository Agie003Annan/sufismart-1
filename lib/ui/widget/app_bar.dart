import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AppBarWidget extends StatefulWidget with PreferredSizeWidget{
  final String title, type;

  AppBarWidget({Key key, this.title, this.type}) : super(key: key);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarWidgetState extends State<AppBarWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //backgroundColor: Color(0xffa72026),
      flexibleSpace: widget.type == "text" ?
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Color(0xffE82329),
                  Color(0xffFF4D00),
                ])
        ),
      ) : Container(
        decoration: BoxDecoration(
            color: Colors.indigo
        ),
      ),
      elevation: 0,
      automaticallyImplyLeading: false,
      title: widget.type == "text" ? Text(widget.title, style: TextStyle(fontSize: 14),) : Image.asset('assets/images/title.png', fit: BoxFit.cover, width: 120),
    );
  }
}
