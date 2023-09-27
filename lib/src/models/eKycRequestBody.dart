import 'package:flutter/material.dart';

class EkycRequestBody{
  String bankName;
  String ifscCode;
  String accountNumber; 
  String bankHolderName;
  String upi;
  String adhaarPicUlr;
  String adhaarBackPicUrl;
  String panPicUrl;
  EkycRequestBody({required this.bankName,required this.ifscCode,required this.accountNumber,required this.bankHolderName,required this.upi,required this.adhaarPicUlr,
  required this.adhaarBackPicUrl,
  required this.panPicUrl
  
  });
}