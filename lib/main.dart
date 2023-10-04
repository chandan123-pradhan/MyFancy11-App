import 'package:cricket_fantacy/src/ui/screens/splash_screen.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: ColorConstant.primaryWhiteColor, // navigation bar color
    statusBarColor: ColorConstant.primaryColor, // status bar color
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Myfancy11',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen()
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:just_the_tooltip/just_the_tooltip.dart';

// void main() {
// runApp(MaterialApp(
// 	home: Scaffold(
//   appBar: AppBar(title: const Text('It goes under me')),
//   body: JustTheTooltipArea(
//     builder: (context, tooltip, scrim) {
//       return Stack(
//         fit: StackFit.passthrough,
//         children: [
//           ListView.builder(
//             itemCount: 30,
//             itemBuilder: (context, index) {
//               if (index == 15) {
//                 return JustTheTooltipEntry(
//                   tailLength: 10.0,
//                   preferredDirection: AxisDirection.down,
//                   isModal: true,
//                   margin: const EdgeInsets.all(20.0),
//                   child: const Material(
//                     color: Colors.blue,
//                     shape: CircleBorder(),
//                     elevation: 4.0,
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Icon(
//                         Icons.touch_app,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   content: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Container(
//                         height: 120,
//                         color: Colors.blue,
//                         width: double.infinity,
//                       ),
//                       const SizedBox(height: 8),
//                       const Text(
//                         'Quia ducimus eius magni voluptatibus ut veniam ducimus. Ullam ab qui voluptatibus quos est in. Maiores eos ab magni tempora praesentium libero. Voluptate architecto rerum vel sapiente ducimus aut cumque quibusdam. Consequatur illo et quos vel cupiditate quis dolores at.',
//                       ),
//                     ],
//                   ),
//                 );
//               }

//               return ListTile(title: Text('Item $index'));
//             },
//           ),
//           // In the case of no scrim showing, this will return an SizedBox.shrink
//          scrim,
//           // In the case of no scrim showing, this will return an SizedBox.shrink
//           tooltip,
//         ],
//       );
//     },
//   ),
// )));
// }