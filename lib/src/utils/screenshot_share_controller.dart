import 'dart:developer';
import 'dart:io';
// import 'dart:typed_data';

import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
// import 'package:share_plus/share_plus.dart';



class CaptureScreenshot{
 
 void captureAndShareScreen(ScreenshotController controller) async {
 controller.capture().then((Uint8List? image)async {
    //Capture Done
   // debugger();
   
   final directory=(await getApplicationCacheDirectory()).path;
   File imgFile=new File('$directory/current_team_screenshot.png');
   imgFile.writeAsBytes(image!);
   print("file saved in galary");
   await Share.file('My Current Team', 'current_team_screenshot.png', image, 'images/png');
 
   //Share.shareXFiles([v]);
}).catchError((onError) {
    print(onError);
});
   
}

}