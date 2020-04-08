import 'package:flutter/material.dart';
import 'package:gridviewsample/widgets/item_grid.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //global size of variables
    var size = MediaQuery.of(context).size;
    var statusBarSize = MediaQuery.of(context).padding.top;
    final double itemHeight =
        (size.height - kToolbarHeight - statusBarSize) / 2.7;
    final double itemWidth = size.width / 2;

    List<String> list = [
      'Book',
      'Notebook',
      'Magazine',
      'Newspaper',
      'Computer',
      'Chair',
      'Mouse',
      'Keyboard',

    ];

    /*
    Configurations of list to show in through the gridView
    */
    var gridView = Container(
      margin: EdgeInsets.fromLTRB(
        size.height * 0.022,
        size.height * 0.022,
        size.height * 0.022,
        size.height * 0.022,
      ),
      child: GridView.builder(
        //shrinkWrap: true,
        /*
          Use physics if need to block default scroll (frequently used when inside
        another scroll like SingleChildScrollView), or use effects
        */
        //physics: NeverScrollableScrollPhysics(),
        itemCount: list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: (itemWidth / itemHeight),
          //crossAxisCount define the number of Columns
          crossAxisCount: 2,
          /*
            crossAxisSpacing define the space
          (horizontal if scroll vertical / Vertical if scroll horizontal) between the items
          */
          crossAxisSpacing: size.height * 0.022,
          /*
            crossAxisSpacing define the space
          (vertical if scroll vertical / horizontal if scroll horizontal) between the items
          */
          mainAxisSpacing: size.height * 0.022,
        ),
        itemBuilder: (context, index) {
          String listItem = list[index];
          return ItemGrid(
            itemSize: (itemWidth / itemHeight),
            //Send to widget just the first letter and always UpperCase
            title: listItem[0].toUpperCase(),
            //Send to widget the completed string
            description: listItem,
          );
        },
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('GridList'),
      ),
      body: Column(
        children: <Widget>[
          //call the gridView inside an expanded to do not break the screen with overflow size
          Expanded(child: gridView),
        ],
      ),
    );
  }
}
