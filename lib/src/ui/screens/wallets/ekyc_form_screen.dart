import 'dart:developer';
import 'dart:io';

import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/models/eKycRequestBody.dart';
import 'package:cricket_fantacy/src/ui/widgets/shimmer_effect_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';

class EkycFormScreen extends StatefulWidget {
  bool isItForEdit;
  EkycFormScreen({required this.isItForEdit});

  @override
  State<EkycFormScreen> createState() => _EkycFormScreenState();
}

class _EkycFormScreenState extends State<EkycFormScreen> {
  TextEditingController _bankNameController = new TextEditingController();
  TextEditingController _ifscController = new TextEditingController();
  TextEditingController _accountNumberController = new TextEditingController();
  TextEditingController _bankHolderNameController = new TextEditingController();
  TextEditingController _upiIdController = new TextEditingController();
  var _addhaar_front_pic;
  String aadhaar_front_pic_url = '';
  bool imageUploading = false;
  var homeController = Get.put(HomeController());

  @override
  void initState() {
   if(widget.isItForEdit){
     _bankNameController.text =
        homeController.checkEkyApiResponse!.data.bankName;
    _ifscController.text = homeController.checkEkyApiResponse!.data.ifscCode;
    _accountNumberController.text =
        homeController.checkEkyApiResponse!.data.accountNumber;
    _bankHolderNameController.text =
        homeController.checkEkyApiResponse!.data.bankHolder;
    _upiIdController.text = homeController.checkEkyApiResponse!.data.upi;
    aadhaar_front_pic_url = homeController.checkEkyApiResponse!.data.img;
   }
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
            Navigator.pop(context);
          },
          child: Icon(
            Icons.navigate_before,
            size: 30,
            color: ColorConstant.primaryWhiteColor,
          ),
        ),
        centerTitle: false,
        title: Text(
          widget.isItForEdit == true ? "Edit Ekyc Reqest" : "  EKyc Request",
          style: TextStyle(
              color: ColorConstant.primaryWhiteColor,
              fontSize: 17,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return widget.isItForEdit && controller.checkEkyApiResponse == null
                ? shimerEffect(length: 5, context: context)
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          _getItemWidget(
                              title: 'Bank Name',
                              tController: _bankNameController),
                          SizedBox(
                            height: 20,
                          ),
                          _getItemWidget(
                              title: 'IFSC Code', tController: _ifscController),
                          SizedBox(
                            height: 20,
                          ),
                          _getItemWidget(
                              title: 'Account Number',
                              tController: _accountNumberController),
                          SizedBox(
                            height: 20,
                          ),
                          _getItemWidget(
                              title: 'Bank Holder Name',
                              tController: _bankHolderNameController),
                          SizedBox(
                            height: 20,
                          ),
                          _getItemWidget(
                              title: 'UPI ID', tController: _upiIdController),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Upload Aadhaar Front Pic',
                                  style: TextStyle(
                                      color: ColorConstant.primaryBlackColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    // requestCameraPermission();
                                    choosedGalaryOrCamera();
                                  },
                                  child: widget.isItForEdit && _addhaar_front_pic ==null
                                      ? Container(
                                          height: 120,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1,
                                          decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.black38),
                                                  image: _addhaar_front_pic ==
                                                          null
                                                      ? DecorationImage(
                                                          image: NetworkImage(
                                                              aadhaar_front_pic_url),
                                                          fit: BoxFit.fill)
                                                      : DecorationImage(
                                                          image: FileImage(File(
                                                              _addhaar_front_pic
                                                                  .path)),
                                                          fit: BoxFit.fill)),
                                          alignment: Alignment.center,
                                        )
                                      : Container(
                                          height: 120,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1,
                                          decoration: _addhaar_front_pic == null
                                              ? BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.black38),
                                                )
                                              : BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.black38),
                                                  image: DecorationImage(
                                                      image: FileImage(File(
                                                          _addhaar_front_pic
                                                              .path)),
                                                      fit: BoxFit.fill)),
                                          alignment: Alignment.center,
                                          child: _addhaar_front_pic == null
                                              ? Icon(
                                                  Icons.image,
                                                  size: 60,
                                                  color: Colors.black38,
                                                )
                                              : imageUploading == true
                                                  ? CircularProgressIndicator(
                                                      color: Colors.white,
                                                    )
                                                  : Container(),
                                        ),
                                ),
                              ]),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              if (_bankNameController.text.isNotEmpty) {
                                if (_ifscController.text.isNotEmpty) {
                                  if (_accountNumberController
                                      .text.isNotEmpty) {
                                    if (_bankHolderNameController
                                        .text.isNotEmpty) {
                                      if (_upiIdController.text.isNotEmpty) {
                                        if (aadhaar_front_pic_url != '') {
                                          EkycRequestBody body =
                                              EkycRequestBody(
                                                  bankName:
                                                      _bankNameController.text,
                                                  ifscCode:
                                                      _ifscController.text,
                                                  accountNumber:
                                                      _accountNumberController
                                                          .text,
                                                  bankHolderName:
                                                      _bankHolderNameController
                                                          .text,
                                                  upi: _upiIdController.text,
                                                  adhaarPicUlr:
                                                      aadhaar_front_pic_url);
                                          homeController.requestEky(
                                              context: context,
                                              ekycRequestBody: body);
                                        } else {
                                          Messages().showErrorMsg(
                                              context: context,
                                              message:
                                                  'Aadhaar Front Photo is Required');
                                        }
                                      } else {
                                        Messages().showErrorMsg(
                                            context: context,
                                            message: 'UPI ID is Required');
                                      }
                                    } else {
                                      Messages().showErrorMsg(
                                          context: context,
                                          message:
                                              'Account Holdername is required');
                                    }
                                  } else {
                                    Messages().showErrorMsg(
                                        context: context,
                                        message: 'Account number is Required');
                                  }
                                } else {
                                  Messages().showErrorMsg(
                                      context: context,
                                      message: 'IFSC Code is Required');
                                }
                              } else {
                                Messages().showErrorMsg(
                                    context: context,
                                    message: 'Bank Name is Required');
                              }
                            },
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: ColorConstant.primaryBlackColor),
                              alignment: Alignment.center,
                              child: Text(
                             widget.isItForEdit==true?"Edit":   "Submit",
                                style: TextStyle(
                                    color: ColorConstant.primaryWhiteColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
          }),
    );
  }

  Widget _getItemWidget(
      {required String title, required TextEditingController tController}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: ColorConstant.primaryBlackColor,
              fontSize: 15,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: tController,
          decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              filled: true,
              hintText: "Enter Here.."),
        ),
      ],
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

  Future<File?> _pickImageFromGallery(ImageSource src) async {
    final picker = ImagePicker();
    _addhaar_front_pic = await picker.pickImage(source: src);
    setState(() {});
    if (_addhaar_front_pic != null) {
      return File(_addhaar_front_pic.path);
      // TODO: Upload the picked image to Firebase Storage
    } else {
      print('No image selected.');
    }
  }

  Future<void> _uploadImageToFirebase(File imageFile) async {
    imageUploading = true;
    setState(() {});
    Reference storageReference =
        FirebaseStorage.instance.ref().child('images/${DateTime.now()}.png');

    UploadTask uploadTask = storageReference.putFile(imageFile);

    await uploadTask.whenComplete(() => print('Image uploaded to Firebase'));

    // Retrieve the download URL
    String downloadURL = await storageReference.getDownloadURL();

    setState(() {
      imageUploading = false;
      aadhaar_front_pic_url = downloadURL;
    });
  }

  void _uploadImage(ImageSource src) async {
    File? imageFile = await _pickImageFromGallery(src);
    if (imageFile != null) {
      await _uploadImageToFirebase(imageFile);
    }
  }

  Future<void> requestCameraPermission() async {
    Navigator.pop(context);
    PermissionStatus status = await Permission.camera.status;
    if (status == PermissionStatus.granted) {
       _uploadImage(ImageSource.camera);
      // Permission is already granted, proceed with using the camera
      // You can navigate to the camera screen or do whatever you need
    } else {
      // Permission is not granted, request it
      PermissionStatus newStatus = await Permission.camera.request();
      if (newStatus == PermissionStatus.granted) {
        _uploadImage(ImageSource.camera);

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
    if(Platform.isAndroid){
              _uploadImage(ImageSource.gallery);
    }else{
    try {
      PermissionStatus status = await Permission.photos.status;
      // debugger();
      if (status == PermissionStatus.granted) {
        _uploadImage(ImageSource.gallery);
        // Permission is already granted, proceed with using the camera
        // You can navigate to the camera screen or do whatever you need
      } else {
        // Permission is not granted, request it
        PermissionStatus newStatus = await Permission.photos.request();
        debugger();
        if (newStatus == PermissionStatus.granted) {
          _uploadImage(ImageSource.gallery);

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
}