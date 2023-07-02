import 'package:carousel_slider/carousel_slider.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/upcomming_matches_dtails.dart';
import 'package:cricket_fantacy/src/ui/widgets/current_match_card_widget.dart';
import 'package:cricket_fantacy/src/ui/widgets/upcomming_matches_card_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FantacyTab extends StatefulWidget {
  const FantacyTab({super.key});

  @override
  State<FantacyTab> createState() => _FantacyTabState();
}

class _FantacyTabState extends State<FantacyTab> {
  int _currentIndex=0;
  void _changeIndex(int index){
    _currentIndex=index;
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "My Matches",
                    style: TextStyle(
                        color: ColorConstant.primaryBlackColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        "View All",
                        style: TextStyle(
                            color: ColorConstant.disableColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                      Icon(
                        Icons.navigate_next_rounded,
                        color: ColorConstant.disableColor,
                        size: 25,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding:  EdgeInsets.only(left: 15, right: 15),
            child: CurrentMatchCardWidget()
            
         
          ),
        
        
          SizedBox(
            height: 10,
          ),
          Container(
            // width: MediaQuery.of(context).size.width/1,
            child: CarouselSlider(
              items: [
                //1st Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://leaddigital.in/wp-content/uploads/2021/04/Banner-IPL.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                //2nd Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://leaddigital.in/wp-content/uploads/2021/04/Banner-IPL.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                //3rd Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://leaddigital.in/wp-content/uploads/2021/04/Banner-IPL.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                //4th Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://leaddigital.in/wp-content/uploads/2021/04/Banner-IPL.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                //5th Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://leaddigital.in/wp-content/uploads/2021/04/Banner-IPL.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],

              //Slider Container properties
              options: CarouselOptions(
                height: 70.0,
                enlargeCenterPage: false,
                // disableCenter: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.93,
                onPageChanged: (index, reason) {
_changeIndex(index);
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int i=0;i<5;i++)
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  height: 7,
                  width: 7,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex==i?ColorConstant.primaryColor:ColorConstant.deviderColor
                  ),
                ),
              )
            ],
          )
       ,
 Padding(
   padding: const EdgeInsets.all(15.0),
   child: Container(
    alignment: Alignment.centerLeft,
     child: const Text(
                        "Upcomming Matches",
                        style: TextStyle(
                            color: ColorConstant.primaryBlackColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                      ),
   ),
 ),

 Padding(
  padding:  EdgeInsets.fromLTRB(15,0,15,15),
  child:   InkWell(
    onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context){
  return UpcommingMatchesDetails();
}));
    },
    child: UpcommingMatchCardWidget()),
),
 Padding(
  padding:  EdgeInsets.fromLTRB(15,0,15,15),
  child:   InkWell(
    onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context){
  return UpcommingMatchesDetails();
}));
    },
    child: UpcommingMatchCardWidget()),
),

 Padding(
  padding:  EdgeInsets.fromLTRB(15,0,15,15),
  child:   InkWell(
    onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context){
  return UpcommingMatchesDetails();
}));
    },
    child: UpcommingMatchCardWidget()),
),

        ],
      ),
    );
  }
}
