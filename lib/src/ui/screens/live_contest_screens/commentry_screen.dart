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
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: widget.commentry.length,
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
                  Text("${widget.commentry[index]['ball']}",
                  style: TextStyle(
                    color: ColorConstant.primaryBlackColor,
                    fontSize: 15,fontWeight: FontWeight.w600
                  ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(child: 
                  Text("${widget.commentry[index]['bowler']['fullname']} To ${widget.commentry[index]['batsman']['fullname']} ${widget.commentry[index]['score']['name']}",
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