import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/global_variable.dart';
import 'package:cricket_fantacy/src/ui/screens/auth_screens/auth_landing_page.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/home_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/my_matches_tab/my_matches_tab.dart';
import 'package:cricket_fantacy/src/ui/screens/notification_screens/Notification_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/portfolio_screens/portfolio_screens.dart';
import 'package:cricket_fantacy/src/ui/screens/wallets/wallet_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/winners_tab/winners_tab.dart';
import 'package:cricket_fantacy/src/ui/widgets/bottom_bar_item.dart';
import 'package:cricket_fantacy/src/ui/widgets/drawer_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:cricket_fantacy/src/utils/local_storage/shared_prefrences.dart';
import 'package:cricket_fantacy/src/utils/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class DashboardScreen extends StatefulWidget {
  final int index;
  DashboardScreen({required this.index});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Widget _body = Container();
  var controller = Get.put(HomeController());
  void _changeIndex(int value) {
    _currentIndex = value;
    _body = _screens[_currentIndex];
    setState(() {});
  }

  List<Widget> _screens = [HomeScreen(), MyMatchesTab(), WinnersTab(),PortfolioScreen()];

  @override
  void initState() {
    _body = _screens[widget.index];
    _currentIndex=widget.index;
    controller.getUsersProfile();
    controller.getMatchesApiCall(context);
    callGetMyMatchApi();
    // TODO: implement initState
    super.initState();
  }

  void callGetMyMatchApi() async {
    await controller.getMyMatch(context, 'fixture');
    // await controller.getMyMatch(context, 'live');
    // await controller.getMyMatch(context, 'completed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _body,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: ColorConstant.primaryColor,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            child: Icon(
              Icons.menu,
              size: 25,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          title: Image.asset(
            ImageUitls.App_Logo,
            height: 40,
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NotificationScreen();
                }));
              },
              child: Image.asset(
                ImageUitls.Notification_icon,
                height: 20,
                width: 20,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            InkWell(
              onTap: () {
                if (logInStatus == true) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WalletScreen();
                  }));
                } else {
                  Messages().showErrorMsg(
                      context: context,
                      message: 'You are a Guest, Please Login First');
                }
              },
              child: Image.asset(
                ImageUitls.Wallet_icon,
                height: 20,
                width: 20,
              ),
            ),
            SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
      drawer: DrawerWidget(),
      bottomSheet: BottomAppBar(
        elevation: 0,
        height: 70,
        color: Colors.transparent,
        child: Container(
          decoration: const BoxDecoration(
            color: ColorConstant.primaryWhiteColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 1),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    _changeIndex(0);
                  },
                  child: BottomBarItem(
                    imageName: ImageUitls.UnSelected_home,
                    title: 'Home',
                    isSelected: _currentIndex == 0 ? true : false,
                  ),
                ),
                InkWell(
                  onTap: () {
                    _changeIndex(1);
                  },
                  child: BottomBarItem(
                    imageName: ImageUitls.UnSelected_mymaches,
                    title: 'My Matches',
                    isSelected: _currentIndex == 1 ? true : false,
                  ),
                ),
                InkWell(
                    onTap: () {
                      _changeIndex(2);
                    },
                    child: BottomBarItem(
                      imageName: ImageUitls.UnSelected_winners,
                      title: 'Winners',
                      isSelected: _currentIndex == 2 ? true : false,
                    )),


                     InkWell(
                    onTap: () {
                      _changeIndex(3);
                    },
                    child: BottomBarItem(
                      imageName: ImageUitls.Profile_icon,
                      title: 'Portfolio',
                      isSelected: _currentIndex == 3 ? true : false,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
