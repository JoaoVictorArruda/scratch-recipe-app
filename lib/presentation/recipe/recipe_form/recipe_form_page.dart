import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scratch_recipe_app/presentation/themes.dart';

class RecipeFormPage extends StatelessWidget {
  const RecipeFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Transform.scale(
                            scale: 0.8,
                            child: Icon(Icons.arrow_back_ios, color: Colors.black54),
                          ),
                          Text('Back to My Recipes', style: TextStyle(color: Colors.black54, fontSize: 15),),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text('Edit Recipe', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset('assets/recipe/recipe_1.jpg', fit: BoxFit.cover, height: 70.0, width: 70.0,)
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 25.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Text('Recipe Name', style: TextStyle(color: Colors.black45, fontSize: 16),)
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: <Widget>[
                                    Flexible(
                                      child: TextFormField(initialValue: 'Sautéed Orange & Mustard', style: TextStyle(fontSize: 18),),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 35,),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15).copyWith(bottom: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Gallery', style: TextStyle(fontSize: 20),),
                                SvgPicture.asset('assets/edit.svg', color: primaryColor, width: 18,)
                              ],
                            ),
                            SizedBox(height: 25,),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Image.asset(
                                    'assets/recipe/recipe_2.jpg',
                                    fit: BoxFit.cover,
                                    height: 150.0,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: Image.asset(
                                          'assets/recipe/recipe_5.jpg',
                                          fit: BoxFit.cover,
                                          height: 120.0,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: Image.asset(
                                          'assets/recipe/recipe_3.jpg',
                                          fit: BoxFit.cover,
                                          height: 120.0,
                                          width: MediaQuery.of(context).size.width * 0.25,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Stack(
                                        children: [
                                          Image.asset(
                                            'assets/recipe/recipe_4.jpg',
                                            fit: BoxFit.cover,
                                            height: 120.0,
                                            width: MediaQuery.of(context).size.width * 0.25,
                                          ),
                                          Container(
                                            height: 120.0,
                                            width: MediaQuery.of(context).size.width * 0.25,
                                            color: Colors.white.withOpacity(0.8),
                                          ),
                                          Positioned.fill(
                                            child: Align(
                                                alignment: AlignmentDirectional.center,
                                                child: Text('12+', style: TextStyle(fontSize: 20),)
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15).copyWith(bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Ingredients', style: TextStyle(fontSize: 20),),
                                SvgPicture.asset('assets/edit.svg', color: primaryColor, width: 18,)
                              ],
                            ),
                            SizedBox(height: 20,),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 60,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                primary: false,
                                itemCount: 5,
                                separatorBuilder: (context, index) {
                                  return const SizedBox(width: 7);
                                },
                                itemBuilder: (context, index) {
                                  if(index == 4) {
                                    return Stack(
                                      children: [
                                        Container(
                                          width: 60.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage('assets/profile/food_1.jpg'),
                                            ),
                                          ),
                                        ),
                                        Positioned.fill(
                                          child: Container(
                                            color: Colors.white.withOpacity(0.8),
                                          ),
                                        ),
                                        Positioned.fill(
                                          top: 15,
                                          child: Align(
                                              alignment: AlignmentDirectional.topCenter,
                                              child: Text('5+', style: TextStyle(fontSize: 20),)
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                  return Column(
                                    children: <Widget>[
                                      Container(
                                        width: 60.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage('assets/profile/food_1.jpg'),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }
                              ),
                            ),
                            SizedBox(height: 20,),
                            Text('Lemonade, coconut, peppers, egg +5 more')
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15).copyWith(bottom: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('How to cook', style: TextStyle(fontSize: 20),),
                                SvgPicture.asset('assets/edit.svg', color: primaryColor, width: 18,)
                              ],
                            ),
                            SizedBox(height: 30,),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 14.0),
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: primaryColor),
                                      shape: BoxShape.circle
                                    ),
                                    child: Center(child: Text('1', style: TextStyle(color: primaryColor),)),
                                  ),
                                ),
                                Text('Heat a Belgian waffle iron.', style: TextStyle(fontSize: 17),)
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 14.0),
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: primaryColor),
                                        shape: BoxShape.circle
                                    ),
                                    child: Center(child: Text('2', style: TextStyle(color: primaryColor),)),
                                  ),
                                ),
                                Flexible(
                                  child: Text('Mix the flour, sugar, and baking powder together in a mixing bowl. Stir in 1 cup eggnog, butter, and the egg until well blended. Add more eggnog if needed to make a pourable batter.',
                                  style: TextStyle(height: 1.3, fontSize: 17),),
                                )
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 14.0),
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: primaryColor),
                                        shape: BoxShape.circle
                                    ),
                                    child: Center(child: Text('3', style: TextStyle(color: primaryColor),)),
                                  ),
                                ),
                                Flexible(child: Text('Lightly grease or spray the waffle iron with non-stick cooking spray. Pour some batter onto the preheated waffle iron,\n...', style: TextStyle(fontSize: 17),))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15).copyWith(bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Additional Info', style: TextStyle(fontSize: 20),),
                                SvgPicture.asset('assets/edit.svg', color: primaryColor, width: 18,)
                              ],
                            ),
                            SizedBox(height: 40,),
                            Table(
                              children: [
                                TableRow(
                                  children: [
                                    Text('Saving time', style: TextStyle(fontSize: 16, color: Colors.black54),),
                                    Text('12 mins', style: TextStyle(fontSize: 16),),
                                  ]
                                ),
                                TableRow(
                                  children: [
                                    SizedBox(height: 20,),
                                    SizedBox(height: 20,),
                                  ]
                                ),
                                TableRow(
                                    children: [
                                      Text('Nutrition Facts', style: TextStyle(fontSize: 16, color: Colors.black54),),
                                      Text('222 calories\n6.2 g fat\n7.2 g carbohydrates\n28.6 g protein\n68 mg cholesterol\n268 mg sodium', style: TextStyle(fontSize: 16, height: 1.4),),
                                    ]
                                ),
                                TableRow(
                                    children: [
                                      SizedBox(height: 20,),
                                      SizedBox(height: 20,),
                                    ]
                                ),
                                TableRow(
                                    children: [
                                      Text('Tags', style: TextStyle(fontSize: 16, color: Colors.black54),),
                                      Text('Sweet,Coconut, Quick, Easy, Homemade', style: TextStyle(fontSize: 16, height: 1.4),),
                                    ]
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15).copyWith(bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Save to', style: TextStyle(fontSize: 18),),
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        underline: Container(),
                                        style: TextStyle(color: Colors.black, fontSize: 20),
                                        icon: Transform.scale(scale: 1.1, child: Icon(Icons.keyboard_arrow_down_outlined)),
                                        value: 'Western (5)',
                                        items: <String>['Western (5)'].map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (_) {},
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      height: 50,
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(8.0),
                                                    side: BorderSide(color: Colors.green, width: 1.5)
                                                )
                                            ),
                                            elevation: MaterialStateProperty.resolveWith<double>(
                                                  (Set<MaterialState> states) {
                                                if (states.contains(MaterialState.disabled)) {
                                                  return 0;
                                                }
                                                return 0;
                                              },
                                            ),
                                          ),
                                          child: Text('Save Recipe', style: TextStyle(color: buttonColor, fontSize: 19),)
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 20,),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                          minimumSize: MaterialStateProperty.all<Size>(Size(50, 45)),
                        ),
                        child: Text('Post to Feed', style: TextStyle(fontSize: 18),)
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform.scale(
                              scale: 0.8,
                              child: Icon(Icons.delete_outline)
                            ),
                            Text('Remove from Cookbook', style: TextStyle(fontSize: 16),)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
          )
      ),
    );
  }
}
