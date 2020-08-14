import 'package:flutter/material.dart';

class DialogForm {
 static Widget dialogForm (BuildContext context,String title,String text){
    // SomeDialog(
    //   context: context,
    //   path: "assets/images/logout_img.png",
    //   mode: SomeMode.Asset,
    //   content: text,
    //   title: title,
    //   appName: "",
    //   imageHeight: 150,
    //   imageWidth: 150,
    //   dialogHeight: 300,
    //   buttonConfig: ButtonConfig(
    //     dialogDone: "Ok",
    //     buttonDoneColor: Hexcolor("0d306b"),
    //   ),
    //   submit: () async {        
    //     // print(prefs.getString('username'));
    //     // print(prefs.getString('is_login'));
    //     //Navigator.of(context).pop();
    //   });
    showDialog(context: context,
    builder: (context){
      return AlertDialog(
        title: Text(title),
        content: Text(text),
        actions: <Widget>[
          FlatButton(child: Text('Ok'),
          onPressed: (){
            Navigator.of(context).pop();
          })
        ],
      );
    }
    );
  }

}