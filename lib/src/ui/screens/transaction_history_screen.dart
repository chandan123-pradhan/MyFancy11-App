import 'package:cricket_fantacy/src/controllers/transaction_history_controller.dart';
import 'package:cricket_fantacy/src/models/transaction_history_api_response.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({super.key});

  @override
  State<TransactionHistoryPage> createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
  var controller = Get.put(TransactionHistoryController());

  @override
  void initState() {
    controller.getTransactionHistory();
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
            "Recent Transactions",
            style: TextStyle(
                color: ColorConstant.primaryWhiteColor,
                fontSize: 17,
                fontWeight: FontWeight.w500),
          ),
          actions: const [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Icon(
                Icons.file_download_outlined,
                size: 25,
                color: ColorConstant.primaryWhiteColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
              child: Icon(
                Icons.filter_alt_sharp,
                size: 25,
                color: ColorConstant.primaryWhiteColor,
              ),
            )
          ],
        ),
        body: GetBuilder<TransactionHistoryController>(
            init: TransactionHistoryController(),
            builder: (controller) {
              return 
              
              
              controller.isDataFetching == true
                  ? Center(
                      child: CircularProgressIndicator(
                        color: ColorConstant.primaryColor,
                      ),
                    )
                  :

                  controller.isEmpty? 

                  
                  Center(
                    child: Text("Data Not Found"),):
                  
                  ListView.builder(
                      itemCount: controller
                          .getTransactionHistoryApiResponse!.data.length,
                      itemBuilder: (context, index) {
                        return _dateWiseTransactionCard(controller
                            .getTransactionHistoryApiResponse!.data[index]);
                      });
            }));
  }

  Widget _dateWiseTransactionCard(TransactionHistory transactionHistory) {
    return Container(
      child: Column(
        children: [
          // SizedBox(
          //   height: 10,
          // ),
          Container(
            height: 40,
            color: ColorConstant.deviderColor,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Row(
                children:  [
                  Icon(
                    Icons.circle,
                    size: 15,
                    color: ColorConstant.deviderColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    transactionHistory.date,
                    style: TextStyle(
                        color: ColorConstant.primaryBlackColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                for (int i = 0; i < transactionHistory.transactionData.length; i++)
                  Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1, color: ColorConstant.deviderColor))),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 1,
                                              color:
                                                  ColorConstant.deviderColor)),
                                      alignment: Alignment.center,
                                      child: Image.asset(
                                        ImageUitls.winner_band,
                                        height: 30,
                                        width: 30,
                                      )),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        transactionHistory.transactionData[i].transectionMode,
                                        style: TextStyle(
                                            color:
                                                ColorConstant.primaryBlackColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                       transactionHistory.transactionData[i].createdDate,
                                        style: TextStyle(
                                            color:
                                                ColorConstant.primaryBlackColor,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Text(
                                "+ ₹${transactionHistory.transactionData[i].amount}",
                                style: TextStyle(
                                    color: ColorConstant.green,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Transaction ID: ",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                transactionHistory.transactionData[i].id,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}