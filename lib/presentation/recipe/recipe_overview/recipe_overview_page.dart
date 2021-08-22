import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scratch_recipe_app/navigator_utils.dart';
import 'package:scratch_recipe_app/presentation/recipe/recipe_form/recipe_form_page.dart';
import 'package:scratch_recipe_app/presentation/themes.dart';

class RecipeOverviewPage extends StatelessWidget {
  const RecipeOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
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
                      Text('Back to my profile', style: TextStyle(color: Colors.black54, fontSize: 15),),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('My Recipes', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),),
                    TextButton(
                      onPressed: () {},
                      child: Text('+ Add New', style: TextStyle(color: primaryColor, fontSize: 20),)
                    )
                  ],
                ),
                SizedBox(height: 30,),
                Padding(
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
                SizedBox(height: 30,),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => pushToPage(context, RecipeFormPage()),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        margin: EdgeInsets.symmetric(vertical: 10).copyWith(right: 0, left: 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 2,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width,
                              child: Image.asset(
                                'assets/recipe/recipe_' + (index + 1).toString() + '.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Sweets',
                                      style: TextStyle(fontSize: 21),
                                      textAlign: TextAlign.start,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis
                                    ),
                                  ),
                                  SizedBox(height: 15,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('± 5 mins · 4 ingredients', style: TextStyle(fontSize: 16, color: Colors.black54),),
                                      Container(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  side: BorderSide(color: primaryColor, width: 1)
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
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(Icons.play_arrow_outlined, color: buttonColor,),
                                              Text('Cook', style: TextStyle(color: buttonColor, fontSize: 16),),
                                            ],
                                          )
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                )
              ],
            ),
          )
        )
      ),
    );
  }
}
