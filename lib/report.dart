
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sentiment_dart/sentiment_dart.dart';
final sentiment = Sentiment();


class report extends StatefulWidget {
  final list;
  const report({this.list});
  @override
  _reportState createState() => _reportState(list:list);
}

class _reportState extends State<report> {
  final list;

  _reportState({this.list});
  var show=false;
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(

        title: Text("Remedium"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                reverse: true,
                itemCount: list.length,
                itemBuilder: (context, index) =>list[index]["data"]==1 ?chat(
                    list[index]["message"].toString(),

                    list[index]["data"]):Container(width:0,height:0),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget chat(String message, int data) {
    return TextButton(
      onPressed: (){
        setState(() {
          show=!show;
        });
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Bubble(
              radius: Radius.circular(15.0),
              color: data == 0 ? Colors.deepOrange : Colors.orangeAccent,
              elevation: 0.0,
              alignment: data == 0 ? Alignment.topLeft : Alignment.topRight,
              nip: data == 0 ? BubbleNip.leftBottom : BubbleNip.rightTop,
              child: Padding(
                padding: EdgeInsets.all(2.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage(
                          data == 0 ? "assets/bot.png" : "assets/user.png"),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Flexible(

                        child: Column(
                          children: [
                            Text(
                              message,
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            ),

                          ],
                        ))
                  ],
                ),
              ),),
          ),
          show?Padding(
            padding: EdgeInsets.all(2.0),
            child: Bubble(
              radius: Radius.circular(15.0),
              color: data == 0 ? Colors.deepOrange : Colors.orangeAccent,
              elevation: 0.0,
              alignment: data == 0 ? Alignment.topLeft : Alignment.topRight,
              nip: data == 0 ? BubbleNip.leftBottom : BubbleNip.rightTop,
              child: Padding(
                padding: EdgeInsets.all(2.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[


                    Flexible(

                        child: Column(
                          children: [

                            Text(
                              '${sentiment.analysis(message,emoji: true)}',
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ))
                  ],
                ),
              ),),
          ):Container(width: 0,height: 0,),
        ],
      ),
    );
  }
}
