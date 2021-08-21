import 'package:flutter/material.dart';

class RecipeCardWidget extends StatelessWidget {
  const RecipeCardWidget({Key? key, required this.asset}) : super(key: key);

  final String asset;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10).copyWith(right: 0, left: 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 2,
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width * 0.42,
            child: Image.asset(
              asset,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                      'Sweets',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
