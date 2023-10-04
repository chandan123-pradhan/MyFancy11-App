import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';

Widget winnerCard(context, var contestData, String matchDate, var matchData) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
    child: Container(
      // height: MediaQuery.of(context).size.height/3,
      width: MediaQuery.of(context).size.width / 1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: Colors.black26)),

      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      matchData['league_name'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    "$matchDate",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width / 1,
              color: Colors.grey[200],
            ),
            // SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 40,
                        child: Stack(
                          children: [
                            Visibility(
                              visible: matchData['winner_team'] ==
                                  matchData['teamid1'],
                              child: Positioned(
                                top: -10,
                                left: 0,
                                right: 5,
                                child: Image.asset(
                                  'assets/icons/crown.png',
                                  height: 30,
                                  width: 20,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(matchData['team1']
                                                ['team_image'] ??
                                            'https://upload.wikimedia.org/wikipedia/commons/e/ef/Virat_Kohli_during_the_India_vs_Aus_4th_Test_match_at_Narendra_Modi_Stadium_on_09_March_2023.jpg'),
                                        fit: BoxFit.fill)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        matchData['team2']['team_short_name'],
                        style: TextStyle(
                            color: ColorConstant.primaryBlackColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Text(
                    "VS",
                    style: TextStyle(
                        color: ColorConstant.primaryBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Text(
                        matchData['team2']['team_short_name'],
                        style: TextStyle(
                            color: ColorConstant.primaryBlackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      Container(
                        height: 50,
                        width: 40,
                        child: Stack(
                          children: [
                            Visibility(
                              visible: matchData['winner_team'] ==
                                  matchData['teamid2'],
                              child: Positioned(
                                top: -10,
                                left: 0,
                                right: 5,
                                child: Image.asset(
                                  'assets/icons/crown.png',
                                  height: 30,
                                  width: 20,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(matchData['team2']
                                                ['team_image'] ??
                                            'https://upload.wikimedia.org/wikipedia/commons/e/ef/Virat_Kohli_during_the_India_vs_Aus_4th_Test_match_at_Narendra_Modi_Stadium_on_09_March_2023.jpg'),
                                        fit: BoxFit.fill)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width / 1,
              color: Colors.grey[200],
            ),

            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  Image.asset(
                    'assets/new_icons/medal.png',
                    height: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "₹${contestData['contest'][0]['first_prize']}",
                    style: TextStyle(
                        color: ColorConstant.primaryBlackColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Container(

                width: MediaQuery.of(context).size.width/1,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 0;
                          i < contestData['contest'][1]['user'].length;
                          i++)
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5,0,5,0),
                          child: Container(
                            //  height: 100,
                            width: MediaQuery.of(context).size.width / 4,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: ColorConstant.deviderColor),
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 6, right: 6),
                                    child: Text(
                                      "Rank #${contestData['contest'][1]['user'][i]['rank']}",
                                      style: TextStyle(
                                          color: ColorConstant.primaryBlackColor,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 6, right: 6),
                                    child: Text(
                                      "${contestData['contest'][1]['user'][i]['name']}",
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage(contestData[
                                                              'contest'][1]['user'][i]
                                                          ['image'] ==
                                                      'NA'
                                                  ? 'https://static.vecteezy.com/system/resources/previews/004/991/321/original/picture-profile-icon-male-icon-human-or-people-sign-and-symbol-vector.jpg'
                                                  : contestData['contest'][1]['user']
                                                      [i]['image']),
                                              fit: BoxFit.fill)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Container(
                                    height: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5)),
                                        color: Colors.blue[100]),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      " Won ₹${contestData['contest'][1]['user'][i]['win_amount']}",
                                      style: TextStyle(
                                          color: ColorConstant.primaryBlackColor,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
