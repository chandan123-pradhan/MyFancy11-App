import 'package:carousel_slider/carousel_slider.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/fantacy_tab.dart';
import 'package:cricket_fantacy/src/ui/widgets/upcomming_matches_card_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class WinnersTab extends StatefulWidget {
  const WinnersTab({super.key});

  @override
  State<WinnersTab> createState() => _WinnersTabState();
}

class _WinnersTabState extends State<WinnersTab>
    with SingleTickerProviderStateMixin {
  int _tabController = 0;
  late TabController _secondTabController;

  @override
  void initState() {
    super.initState();
    _secondTabController = TabController(
        length: 3,
        vsync: this); // Change the length to match the number of tabs
  }

  @override
  void dispose() {
    super.dispose();
    _secondTabController.dispose();
  }

  void _changeTopTab(index) {
    setState(() {
      _tabController = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(
            backgroundColor: ColorConstant.primaryColor,
            elevation: 0,
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // height: MediaQuery.of(context).size.height/5,
            width: MediaQuery.of(context).size.width / 1,
            decoration: const BoxDecoration(
              color: ColorConstant.primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    // height: MediaQuery.of(context).size.height/10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              // width: MediaQuery.of(context).size.width / 4,
                              alignment: Alignment.centerLeft,
                              child: Image.asset(
                                ImageUitls.Profile_icon,
                                height: 35,
                                width: 35,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              // width: MediaQuery.of(context).size.width /   3,
                              alignment: Alignment.center,
                              child: const Text(
                                "Winners",
                                style: TextStyle(
                                    color: ColorConstant.primaryWhiteColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.share,
                          size: 28,
                          color: ColorConstant.primaryWhiteColor,
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 0, right: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              _changeTopTab(0);
                            },
                            child: Column(
                              children: [
                                Icon(Icons.sports_cricket_outlined,
                                    size: 20,
                                    color: _tabController == 0
                                        ? ColorConstant.primaryWhiteColor
                                        : Colors.white54),
                                Text(
                                  "Cricket",
                                  style: TextStyle(
                                      color: _tabController == 0
                                          ? ColorConstant.primaryWhiteColor
                                          : Colors.white54,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 60,
                                  height: 5,
                                  color: _tabController == 0
                                      ? ColorConstant.primaryWhiteColor
                                      : ColorConstant.primaryColor,
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _changeTopTab(1);
                            },
                            child: Column(
                              children: [
                                Icon(Icons.sports_football_outlined,
                                    size: 20,
                                    color: _tabController == 1
                                        ? ColorConstant.primaryWhiteColor
                                        : Colors.white54),
                                Text(
                                  "Footbal",
                                  style: TextStyle(
                                      color: _tabController == 1
                                          ? ColorConstant.primaryWhiteColor
                                          : Colors.white54,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 60,
                                  height: 5,
                                  color: _tabController == 1
                                      ? ColorConstant.primaryWhiteColor
                                      : ColorConstant.primaryColor,
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _changeTopTab(2);
                            },
                            child: Column(
                              children: [
                                Icon(Icons.sports_kabaddi,
                                    size: 20,
                                    color: _tabController == 2
                                        ? ColorConstant.primaryWhiteColor
                                        : Colors.white54),
                                Text(
                                  "Kabaddi",
                                  style: TextStyle(
                                      color: _tabController == 2
                                          ? ColorConstant.primaryWhiteColor
                                          : Colors.white54,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 60,
                                  height: 5,
                                  color: _tabController == 2
                                      ? ColorConstant.primaryWhiteColor
                                      : ColorConstant.primaryColor,
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _changeTopTab(3);
                            },
                            child: Column(
                              children: [
                                Icon(Icons.sports_basketball,
                                    size: 20,
                                    color: _tabController == 3
                                        ? ColorConstant.primaryWhiteColor
                                        : Colors.white54),
                                Text(
                                  "Basketball",
                                  style: TextStyle(
                                      color: _tabController == 3
                                          ? ColorConstant.primaryWhiteColor
                                          : Colors.white54,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 60,
                                  height: 5,
                                  color: _tabController == 3
                                      ? ColorConstant.primaryWhiteColor
                                      : ColorConstant.primaryColor,
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _changeTopTab(4);
                            },
                            child: Column(
                              children: [
                                Icon(Icons.sports_esports_outlined,
                                    size: 20,
                                    color: _tabController == 4
                                        ? ColorConstant.primaryWhiteColor
                                        : Colors.white54),
                                Text(
                                  "Hackey",
                                  style: TextStyle(
                                      color: _tabController == 4
                                          ? ColorConstant.primaryWhiteColor
                                          : Colors.white54,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 60,
                                  height: 5,
                                  color: _tabController == 4
                                      ? ColorConstant.primaryWhiteColor
                                      : ColorConstant.primaryColor,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
         
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Text(
                  "Mega Contest Winners",
                  style: TextStyle(
                      color: ColorConstant.primaryBlackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
          
          Row(
              children: const [
                Text(
                  "Fillter by Series",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(width: 5,),
                Icon(Icons.filter_list,size: 25,color: Colors.black54,)
                
          
              ],
            )
              ],
            ),
          ),
 Padding(
   padding: const EdgeInsets.only(left:15.0,),
   child: Text(
                    "Recent Matches",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
 ),
 Expanded(
  child: ListView.builder(
    itemCount: 2,
    itemBuilder: (context,index){
    return Padding(
      padding: const EdgeInsets.fromLTRB(15,5,15,5),
      child: Container(
       // height: MediaQuery.of(context).size.height/3,
        width: MediaQuery.of(context).size.width/1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1,color: Colors.black26
        )
        ),

child: Padding(
  padding: const EdgeInsets.all(0.0),
  child:   Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(10,10,10,0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                      "FanCode ECS Romania T10",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
              Text(
                      "30 June 2023",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
      
          ],
        ),
      ),
      SizedBox(height: 10,),
     Container(
  height: 1,
  width: MediaQuery.of(context).size.width/1,
    color: Colors.grey[200]
  ,
 ),
     // SizedBox(height: 10,),
      Padding(
        padding: const EdgeInsets.fromLTRB(10,5,10,10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
      Row(
        children: [
          Image.asset(ImageUitls.Team_2_logo,height: 30,width: 30,),
          SizedBox(width: 10,),
          Text("CSK",
          style: TextStyle(
            color: ColorConstant.primaryBlackColor,
            fontSize: 14,
            fontWeight: FontWeight.w500
          ),
          )
        ],
      ),
      Text("VS",
          style: TextStyle(
            color: ColorConstant.primaryBlackColor,
            fontSize: 14,
            fontWeight: FontWeight.w500
          ),
          ),

 Row(
        children: [
          Image.asset(ImageUitls.Team_2_logo,height: 30,width: 30,),
          SizedBox(width: 10,),
          Text("CSK",
          style: TextStyle(
            color: ColorConstant.primaryBlackColor,
            fontSize: 14,
            fontWeight: FontWeight.w500
          ),
          )
        ],
      )

          ],
        ),
      )
  
  
 , 
 Container(
  height: 1,
  width: MediaQuery.of(context).size.width/1,
  color: Colors.grey[200]
  ,
 ),

SizedBox(height: 10,),
  Padding(
    padding: const EdgeInsets.only(left:15,right: 15),
    child: Row(
      children: [
        Icon(Icons.wine_bar_outlined,size:30,color: ColorConstant.primaryBlackColor,),
        SizedBox(width: 10,),
        Text("86 lakhs",
                style: TextStyle(
                  color: ColorConstant.primaryBlackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600
                ),
                ),
      ],
    ),
  ),


  Padding(
    padding: const EdgeInsets.fromLTRB(15,10,15,10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
        //  height: 100,
          width: MediaQuery.of(context).size.width/4,
          decoration: BoxDecoration(
            border: Border.all(width: 1,color: ColorConstant.deviderColor),
            borderRadius: BorderRadius.circular(5)
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,6,0,0),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                 Padding(
                   padding: const EdgeInsets.only(left:6,right: 6),
                   child: Text("Rank #1",
                                 style: TextStyle(
                    color: ColorConstant.primaryBlackColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600
                                 ),
                                 ),
                 ),
               Padding(
                   padding: const EdgeInsets.only(left:6,right: 6),
                   child:    Text("Super star P",
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 10,
                  fontWeight: FontWeight.w600
                ),
                ),),
                SizedBox(height: 10,),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT57f8aco5dcp2ifXE_D35P2RrvpZGMePmpEg&usqp=CAU"),
                      
                      fit: BoxFit.fill
                      )
                    ),
                 
                  ),

                ),
                 SizedBox(height: 6,),
                 Container(
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5)
                    ),
                    color: Colors.blue[100]
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(" Won ₹5.5 Lakhs",
                  style: TextStyle(
                    color: ColorConstant.primaryBlackColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w600
                  ),
                  ),
                 )
              ],
            ),
          ),
        ),
      
     
      Container(
        //  height: 100,
          width: MediaQuery.of(context).size.width/4,
          decoration: BoxDecoration(
            border: Border.all(width: 1,color: ColorConstant.deviderColor),
            borderRadius: BorderRadius.circular(5)
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,6,0,0),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                 Padding(
                   padding: const EdgeInsets.only(left:6,right: 6),
                   child: Text("Rank #1",
                                 style: TextStyle(
                    color: ColorConstant.primaryBlackColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600
                                 ),
                                 ),
                 ),
               Padding(
                   padding: const EdgeInsets.only(left:6,right: 6),
                   child:    Text("Super star P",
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 10,
                  fontWeight: FontWeight.w600
                ),
                ),),
                SizedBox(height: 10,),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT57f8aco5dcp2ifXE_D35P2RrvpZGMePmpEg&usqp=CAU"),
                      
                      fit: BoxFit.fill
                      )
                    ),
                 
                  ),

                ),
                 SizedBox(height: 6,),
                 Container(
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5)
                    ),
                    color: Colors.blue[100]
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(" Won ₹5.5 Lakhs",
                  style: TextStyle(
                    color: ColorConstant.primaryBlackColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w600
                  ),
                  ),
                 )
              ],
            ),
          ),
        ),
      Container(
        //  height: 100,
          width: MediaQuery.of(context).size.width/4,
          decoration: BoxDecoration(
            border: Border.all(width: 1,color: ColorConstant.deviderColor),
            borderRadius: BorderRadius.circular(5)
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,6,0,0),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                 Padding(
                   padding: const EdgeInsets.only(left:6,right: 6),
                   child: Text("Rank #1",
                                 style: TextStyle(
                    color: ColorConstant.primaryBlackColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600
                                 ),
                                 ),
                 ),
               Padding(
                   padding: const EdgeInsets.only(left:6,right: 6),
                   child:    Text("Super star P",
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 10,
                  fontWeight: FontWeight.w600
                ),
                ),),
                SizedBox(height: 10,),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT57f8aco5dcp2ifXE_D35P2RrvpZGMePmpEg&usqp=CAU"),
                      
                      fit: BoxFit.fill
                      )
                    ),
                 
                  ),

                ),
                 SizedBox(height: 6,),
                 Container(
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5)
                    ),
                    color: Colors.blue[100]
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(" Won ₹5.5 Lakhs",
                  style: TextStyle(
                    color: ColorConstant.primaryBlackColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w600
                  ),
                  ),
                 )
              ],
            ),
          ),
        ),
     
     
     
     
      ],
    ),
  )


    ],
  ),
),


      ),
    );
  }), 
 
 
 
 )



        ],
      ),
    );
  }
}
