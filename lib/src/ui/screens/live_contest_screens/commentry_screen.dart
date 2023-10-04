import 'dart:developer';

import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:flutter/material.dart';


class CommentryScreen extends StatefulWidget {
  List commentry;
  CommentryScreen({required this.commentry});

  @override
  State<CommentryScreen> createState() => _CommentryScreenState();
}

class _CommentryScreenState extends State<CommentryScreen> {
  @override
  void initState() {
    print(widget.commentry);
   // debugger();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  List commentry= widget.commentry.reversed.toList();
    return Container(
      child: ListView.builder(
        itemCount: commentry.reversed.length,
        itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.fromLTRB(15,10,15,10),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,color: Colors.black12
                )
              )
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom:4.0),
              child: Row(
                children: [
                  Text("${commentry[index]['ball']}",
                  style: TextStyle(
                    color: ColorConstant.primaryBlackColor,
                    fontSize: 15,fontWeight: FontWeight.w600
                  ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(child: 
                  Text("${commentry[index]['bowler']['fullname']} To ${commentry[index]['batsman']['fullname']} ${commentry[index]['score']['name']}",
                  style: TextStyle(
                    color: ColorConstant.primaryBlackColor,
                    fontSize: 15,fontWeight: FontWeight.w500
                  ),
                  ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}