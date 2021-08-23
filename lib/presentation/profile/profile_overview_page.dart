import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scratch_recipe_app/application/profile/profile_overview_cubit.dart';
import 'package:scratch_recipe_app/domain/profile/i_profile_repository.dart';
import 'package:scratch_recipe_app/domain/profile/profile.dart';
import 'package:scratch_recipe_app/navigator_utils.dart';
import 'package:scratch_recipe_app/presentation/profile/widgets/recipe_card_widget.dart';
import 'package:scratch_recipe_app/presentation/recipe/recipe_overview/recipe_overview_page.dart';

class ProfileOverviewPage extends StatefulWidget {
  ProfileOverviewPage({Key? key}) : super(key: key);

  @override
  _ProfileOverviewPageState createState() => _ProfileOverviewPageState();
}

class _ProfileOverviewPageState extends State<ProfileOverviewPage> {

  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => ProfileOverviewCubit(context.read<IProfileRepository>())..initial(),
        child: BlocConsumer<ProfileOverviewCubit, ProfileOverviewState>(
        listener: (BuildContext context, ProfileOverviewState state) {

        },
        builder: (BuildContext context, ProfileOverviewState state) {
          if (state.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
              bottomNavigationBar: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.12,
                  child:  BottomAppBar(
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 44,
                              child: Material(
                                type: MaterialType.transparency,
                                child: InkWell(
                                  onTap: () {},
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SvgPicture.asset('assets/search.svg', width: 24,)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 44,
                              child: Material(
                                type: MaterialType.transparency,
                                child: GestureDetector(
                                  onTap: () {
                                    pushToPage(context, RecipeOverviewPage());
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SvgPicture.asset('assets/screen.svg')
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 44,
                              child: Material(
                                type: MaterialType.transparency,
                                child: InkWell(
                                  // onTap: _incrementCounter,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SvgPicture.asset('assets/cook_hat.svg', width: 26,)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                  )
              ),
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
                                // Icon(Icons.settings,),
                                SvgPicture.asset('assets/settings.svg'),
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
                          if(Profile.isFacebook) Container(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.22,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          state.profile.image)
                                  )
                              )),
                          if(!Profile.isFacebook) Container(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.22,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          state.profile.image)
                                  )
                              )),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(state.profile.name, style: TextStyle(fontSize: 19),),
                                      SvgPicture.asset('assets/edit.svg', width: 18, color: Colors.black87,),
                                      // Icon(Icons.edit)
                                    ],
                                  ),
                                  SizedBox(height: 8,),
                                  Text(state.profile.description, style: TextStyle(fontSize: 16, color: Color(0xFF666666)),),
                                  SizedBox(height: 15,),
                                  Text('${state.profile.followers} followers • ${state.profile.likes} likes', style: TextStyle(fontSize: 16, color: Color(0xFF666666)),),
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
                                Text(state.profile.recipes.length.toString(), style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, fontFamily: 'SFNS', color: currentTab == 0 ? Colors.black : Colors.grey),),
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
                                Text(state.profile.saved, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, fontFamily: 'SFNS', color: currentTab == 1 ? Colors.black : Colors.grey),),
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
                                Text(state.profile.following, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, fontFamily: 'SFNS', color: currentTab == 2 ? Colors.black : Colors.grey),),
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
                          itemCount: (state.profile.recipes.length / 2).round(),
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RecipeCardWidget(recipe: state.profile.recipes[index * 2],),
                                RecipeCardWidget(recipe: state.profile.recipes[index * 2 + 1],)
                              ],
                            );
                          },
                        ),
                      if(currentTab == 1) Text('Saved - Coming soon'),
                      if(currentTab == 2) Text('Following - Coming soon'),
                    ],
                  ),
                ),
              )
          );
        })
      );
  }
}
