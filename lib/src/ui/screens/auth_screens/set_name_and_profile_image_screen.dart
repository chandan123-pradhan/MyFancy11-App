import 'dart:io';

import 'package:cricket_fantacy/src/controllers/auth_controllers.dart';
import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/ui/screens/auth_screens/otp_screen.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileSetupScreen extends StatefulWidget {
  String? email;
  ProfileSetupScreen({this.email});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  bool _isActive = true;
  var controller = Get.put(AuthController());
  int selectedIndex = -1;
  var profilePic;
  String proifleUrl = '';

  @override
  void initState() {
    controller.updateEmail(widget.email);
    controller.getAwatarList(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.bg_color,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConstant.primaryColor,
        leading: InkWell(
          onTap: () {
            // Navigator.pop(context);
          },
          child: Icon(
            Icons.navigate_before,
            size: 30,
            color: ColorConstant.primaryWhiteColor,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Profie Setup",
              style: TextStyle(
                  color: ColorConstant.primaryWhiteColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      body: GetBuilder<AuthController>(
          init: AuthController(),
          builder: (controller) {
            return controller.awatarListApiResponse == null
                ? Center(
                    child: CircularProgressIndicator(
                      color: ColorConstant.primaryColor,
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(children: [
                      SizedBox(
                        height: 20,
                      ),
                      // Container(
                      //   alignment: Alignment.centerLeft,
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(left: 20),
                      //     child: Text(
                      //       "Select Avatar",
                      //       style: TextStyle(
                      //           color: ColorConstant.primaryBlackColor,
                      //           fontSize: 15,
                      //           fontWeight: FontWeight.w600),
                      //     ),
                      //   ),
                      // ),

                      InkWell(
                        onTap: () {
                         // choosedGalaryOrCamera();
                        },
                        child: Container(
                          height: 70,
                          width: 70,
                          child: Stack(
                            children: [
                            profilePic==null?
                            
                              Container(
                                 height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.black12,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1, color: Colors.black)),
                             alignment: Alignment.center,
                             child: Icon(Icons.person_2_outlined),
                             
                              ):
                              
                               Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.black12,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1, color: Colors.black),
                                        image: DecorationImage(image: 
                                        FileImage(File(profilePic.path)),
                                        fit: BoxFit.fill
                                        
                                        ),
                                        
                                        
                                        ),
                           
                             
                             
                              )
                              
                              ,
                              // Positioned(
                              //     right: 10,
                              //     bottom: 10,
                              //     child: Icon(
                              //       Icons.camera_alt_outlined,
                              //       size: 20,
                              //       color: ColorConstant.primaryBlackColor,
                              //     ))
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          controller: controller.nameController,
                          onChanged: (val) {},
                          decoration: InputDecoration(
                              // suffixIcon: Icon(
                              //   Icons.paste,
                              //   size: 20,
                              //   color: ColorConstant.primaryBlackColor,
                              // ),
                              filled: true,
                              hintText: "Enter Name"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          enabled: widget.email != null ? false : true,
                          controller: controller.emailController,
                          onChanged: (val) {},
                          decoration:
                              InputDecoration(filled: true, hintText: "Email"),
                        ),
                      ),



                  widget.email!=null?    Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          enabled: widget.email != null ? false : true,
                          controller: controller.phoneNumberController,
                          onChanged: (val) {},
                          decoration:
                              InputDecoration(filled: true, hintText: "Email"),
                        ),
                       ):Container(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
                        child: InkWell(
                          onTap: () {
                            if (_isActive == true) {
                              controller.updateProfile(context);
                              // Navigator.push(
                              //   context,
                              //   (MaterialPageRoute(
                              //     builder: (context) {
                              //       return OtpScreen();
                              //     },
                              //   )),
                              // );
                            }
                          },
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: _isActive == true
                                    ? ColorConstant.primaryBlackColor
                                    : Colors.grey[400]),
                            alignment: Alignment.center,
                            child: Text(
                              "Update",
                              style: TextStyle(
                                  color: ColorConstant.primaryWhiteColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      // Text(
                      //   "Not Now? Skip",
                      //   style: TextStyle(
                      //       color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),
                      // ),
                    ]),
                  );
          }),
    );
  }

  void choosedGalaryOrCamera() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Choosed From where you want to upload?",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      requestCameraPermission();
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            size: 30,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Camera",
                            style: TextStyle(
                                color: ColorConstant.primaryBlackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      onTap: () async {
                        requestGalleryPermission();
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Icon(
                              Icons.photo_camera_back_outlined,
                              size: 30,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              "Gallery",
                              style: TextStyle(
                                  color: ColorConstant.primaryBlackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
          );
        });
  }

  Future<void> requestCameraPermission() async {
    Navigator.pop(context);
    PermissionStatus status = await Permission.camera.status;
    if (status == PermissionStatus.granted) {
      _uploadImage(
        ImageSource.camera,
      );
      // Permission is already granted, proceed with using the camera
      // You can navigate to the camera screen or do whatever you need
    } else {
      // Permission is not granted, request it
      PermissionStatus newStatus = await Permission.camera.request();
      if (newStatus == PermissionStatus.granted) {
        _uploadImage(
          ImageSource.camera,
        );

        // Permission granted, proceed with using the camera
      } else {
        // Permission denied, show a message or handle accordingly
        print('Camera permission denied');
        // await Permission.camera.request();
      }
    }
  }

  Future<void> requestGalleryPermission() async {
    Navigator.pop(context);
    if (Platform.isAndroid) {
      _uploadImage(ImageSource.gallery);
    } else {
      try {
        PermissionStatus status = await Permission.photos.status;
        // debugger();
        if (status == PermissionStatus.granted) {
          _uploadImage(
            ImageSource.gallery,
          );
          // Permission is already granted, proceed with using the camera
          // You can navigate to the camera screen or do whatever you need
        } else {
          // Permission is not granted, request it
          PermissionStatus newStatus = await Permission.photos.request();
          if (newStatus == PermissionStatus.granted) {
            _uploadImage(
              ImageSource.gallery,
            );

            // Permission granted, proceed with using the camera
          } else {
            // Permission denied, show a message or handle accordingly
            print('galaery permission denied');

            //await Permission.camera.request();
          }
        }
      } catch (e) {
        print("error =$e");
      }
    }
  }

  void _uploadImage(ImageSource src) async {
    File? imageFile = await _pickImageFromGallery(
      src,
    );
    if (imageFile != null) {
      await _uploadImageToFirebase(imageFile);
    }
  }

  Future<File?> _pickImageFromGallery(ImageSource src) async {
    final picker = ImagePicker();

    profilePic = await picker.pickImage(source: src);
    setState(() {});
    if (profilePic != null) {
      return File(profilePic.path);
      // TODO: Upload the picked image to Firebase Storage
    } else {
      print('No image selected.');
    }
  }

  bool imageUploading = false;
  Future<void> _uploadImageToFirebase(File imageFile) async {
    imageUploading = true;
    setState(() {});
    Reference storageReference =
        FirebaseStorage.instance.ref().child('images/${DateTime.now()}.png');

    UploadTask uploadTask = storageReference.putFile(imageFile);

    await uploadTask.whenComplete(() => print('Image uploaded to Firebase'));
// debugger();
    // Retrieve the download URL
    String downloadURL = await storageReference.getDownloadURL();
// debugger();

    setState(() {
      imageUploading = false;
      
    });
    controller.selectedAwatarLink = downloadURL;
  }
}
