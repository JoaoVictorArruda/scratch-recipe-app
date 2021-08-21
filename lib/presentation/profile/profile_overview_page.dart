import 'package:flutter/material.dart';
import 'package:scratch_recipe_app/presentation/profile/widgets/recipe_card_widget.dart';

class ProfileOverviewPage extends StatefulWidget {
  ProfileOverviewPage({Key? key}) : super(key: key);

  @override
  _ProfileOverviewPageState createState() => _ProfileOverviewPageState();
}

class _ProfileOverviewPageState extends State<ProfileOverviewPage> {

  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('My Kitchen', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),),
                    Row(
                      children: [
                        Icon(Icons.settings,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('Settings', style: TextStyle(fontSize: 18),),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Image.asset('assets/profile/profile_logo.png', width: MediaQuery.of(context).size.width * 0.22,),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Nick Evans', style: TextStyle(fontSize: 19),),
                              Icon(Icons.edit)
                            ],
                          ),
                          SizedBox(height: 8,),
                          Text('Potato Master', style: TextStyle(fontSize: 16, color: Color(0xFF666666)),),
                          SizedBox(height: 15,),
                          Text('584 followers • 23k likes', style: TextStyle(fontSize: 16, color: Color(0xFF666666)),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Divider(thickness: 1,),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      children: [
                        Text('20', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, fontFamily: 'SFNS', color: currentTab == 0 ? Colors.black : Colors.grey),),
                        SizedBox(height: 10,),
                        Text('Recipes', style: TextStyle(fontSize: 20, color: currentTab == 0 ? Colors.black : Colors.grey),),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      children: [
                        Text('75', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, fontFamily: 'SFNS', color: currentTab == 1 ? Colors.black : Colors.grey),),
                        SizedBox(height: 10,),
                        Text('Saved', style: TextStyle(fontSize: 20, color: currentTab == 1 ? Colors.black : Colors.grey),),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      children: [
                        Text('248', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, fontFamily: 'SFNS', color: currentTab == 2 ? Colors.black : Colors.grey),),
                        SizedBox(height: 10,),
                        Text('Following', style: TextStyle(fontSize: 20, color: currentTab == 2 ? Colors.black : Colors.grey),),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(
                    3,
                        (index) => Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          AnimatedContainer(
                            height: 5,
                            decoration: BoxDecoration(
                              color: index == currentTab ? Colors.green : Colors.transparent,
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(40.0),
                                topRight: const Radius.circular(40.0),
                              )
                            ),
                            duration: const Duration(milliseconds: 300),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ),
            if(currentTab == 0)
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                primary: false,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RecipeCardWidget(asset: 'assets/profile/food_' + (index * 2 + 1).toString() + '.jpg'),
                      RecipeCardWidget(asset: 'assets/profile/food_' + (index * 2 + 2).toString() + '.jpg'),
                    ],
                  );
                },
              ),
            if(currentTab == 1) Text('1'),
            if(currentTab == 2) Text('2'),
            ],
          ),
        ),
      )
    );
  }
}
