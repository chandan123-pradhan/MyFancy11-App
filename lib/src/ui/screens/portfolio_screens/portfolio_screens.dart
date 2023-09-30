import 'package:cricket_fantacy/src/ui/screens/portfolio_screens/my_portfolioTab.dart';
import 'package:cricket_fantacy/src/ui/screens/portfolio_screens/quiz_list_page.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:flutter/material.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen>with SingleTickerProviderStateMixin {
  late TabController _secondTabController;


@override
  void initState() {
     _secondTabController = TabController(length: 2, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width / 1,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 1,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TabBar(
                
                controller: _secondTabController,
                indicatorColor: ColorConstant.primaryColor,
                indicatorWeight: 5,
                labelColor: ColorConstant.primaryBlackColor,
                tabs: const [
                  Tab(
                    text: 'Portfolio',
                  ),
                  Tab(text: "My Portfolio"),
                
                ],
              ),
            ),
          ),
        Expanded(
            child: TabBarView(
              controller: _secondTabController,
              children: [
                QuizListPage(),
                PortfolioTab()
              ],
            ),
          )
        ],
      ),
    );
  }
}