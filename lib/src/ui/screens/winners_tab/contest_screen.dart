import 'package:cricket_fantacy/src/ui/screens/winners_tab/winner_card.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ContestScreen extends StatefulWidget {
  var matchData;
  ContestScreen({required this.matchData});

  @override
  State<ContestScreen> createState() => _ContestScreenState();
}

class _ContestScreenState extends State<ContestScreen> {
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
          "Contest List",
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
      body: ListView.builder(
          itemCount: widget.matchData['contest_data'].length,
          itemBuilder: (context, index) {
            return winnerCard(
                context,
                widget.matchData['contest_data'][index],
               
                DateFormat('dd-MMMM-yyyy')
                    .format(DateTime.parse(
                        widget.matchData['match']['match_date_time']))
                    .toString(),
                widget.matchData['match']);
          }),
    );
  }
}
