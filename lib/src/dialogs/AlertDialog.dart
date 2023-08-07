import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:flutter/material.dart';




Future<void>showAlertDialogboxWidget(BuildContext context,msg,onTap) async{
  AlertDialog alert = AlertDialog(
    content:  Container(
     height: 120,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           
                 Container(
                  width: MediaQuery.of(context).size.width/1.2,
                   child: Text(msg,
                   maxLines: 3,
                   textAlign: TextAlign.center,
                   overflow: TextOverflow.ellipsis,
                   style: TextStyle(
                    
                    color: ColorConstant.primaryBlackColor,
                    fontSize: 14,fontWeight: FontWeight.w500
                   ),),
                 ),
              
            
          
          SizedBox(height: 20,),
            InkWell(
              onTap: (){
                onTap();
              },
              child: Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: ColorConstant.primaryColor,
                  
                ),
                alignment: Alignment.center,
                child:const Text("Okay",style: TextStyle(
                    color: ColorConstant.primaryWhiteColor,
                    fontSize: 16,fontWeight: FontWeight.w600
                   ),),
              ),
            )
          ],
        ),
      ),
    ),
    
  );
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

