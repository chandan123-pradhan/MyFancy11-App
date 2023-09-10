import 'package:cricket_fantacy/src/controllers/player_profile_controller.dart';
import 'package:cricket_fantacy/src/models/get_squad_api_response.dart';
import 'package:cricket_fantacy/src/ui/widgets/shimmer_effect_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayerProfilePage extends StatefulWidget {
  SquadPlayer player;
  PlayerProfilePage({required this.player});

  @override
  State<PlayerProfilePage> createState() => _PlayerProfilePageState();
}

class _PlayerProfilePageState extends State<PlayerProfilePage> {
  var controller = Get.put(PlayerProfileController());
  @override
  void initState() {
    controller.getPlayerProfile(widget.player.playerid);
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
          widget.player.name,
          style: TextStyle(
              color: ColorConstant.primaryWhiteColor,
              fontSize: 17,
              fontWeight: FontWeight.w600),
        ),

        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 20.0),
        //     child: Image.asset(
        //       ImageUitls.Wallet_icon,
        //       height: 20,
        //       width: 20,
        //     ),
        //   )
        // ],
      ),
      body: GetBuilder<PlayerProfileController>(
          init: PlayerProfileController(),
          builder: (controller) {
            return controller.playerProfileApiResponse == null
                ? Center(
                    child: Container(
                        height: MediaQuery.of(context).size.height / 1,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: shimerEffect(length: 5, context: context),
                        )))
                : SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 1,
                      width: MediaQuery.of(context).size.width / 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 1, color: Colors.black38),
                                  image: DecorationImage(
                                      image: NetworkImage(controller
                                          .playerProfileApiResponse!
                                          .playerinfo
                                          .image),
                                      fit: BoxFit.contain)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Name:',
                                  style: TextStyle(
                                      color: ColorConstant.primaryBlackColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  controller.playerProfileApiResponse!
                                      .playerinfo.name,
                                  style: TextStyle(
                                      color: ColorConstant.primaryBlackColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'DOB:',
                                  style: TextStyle(
                                      color: ColorConstant.primaryBlackColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  controller
                                      .playerProfileApiResponse!.playerinfo.dob,
                                  style: TextStyle(
                                      color: ColorConstant.primaryBlackColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Designation:',
                                  style: TextStyle(
                                      color: ColorConstant.primaryBlackColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  widget.player.playerDesigination,
                                  style: TextStyle(
                                      color: ColorConstant.primaryBlackColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                         controller.playerProfileApiResponse!.playerinfo
                                        .bats ==
                                    'null'
                                ? Container()
                                :      SizedBox(
                              height: 10,
                            ),
                          controller.playerProfileApiResponse!.playerinfo
                                        .bats ==
                                    'null'
                                ? Container()
                                :     Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Bat:',
                                  style: TextStyle(
                                      color: ColorConstant.primaryBlackColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  controller.playerProfileApiResponse!
                                      .playerinfo.bats,
                                  style: TextStyle(
                                      color: ColorConstant.primaryBlackColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                     controller.playerProfileApiResponse!.playerinfo
                                        .bowls ==
                                    'null'
                                ? Container()
                                :          SizedBox(
                              height: 10,
                            ),
                            controller.playerProfileApiResponse!.playerinfo
                                        .bowls ==
                                    'null'
                                ? Container()
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Bowl:',
                                        style: TextStyle(
                                            color:
                                                ColorConstant.primaryBlackColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        controller.playerProfileApiResponse!
                                            .playerinfo.bowls,
                                        style: TextStyle(
                                            color:
                                                ColorConstant.primaryBlackColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
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
