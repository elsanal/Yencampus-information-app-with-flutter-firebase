import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yencampus/Components/PagesBody.dart';
import 'package:yencampus/Components/PagesSliverBar.dart';
import 'package:yencampus/Decoration/FormField.dart';
import 'package:yencampus/Function/Locale.dart';
import 'package:yencampus/Function/getImageData.dart';
import 'package:yencampus/Function/translation.dart';
import 'package:yencampus/Models/ImageClass.dart';


class Carer extends StatefulWidget {
  const Carer({Key? key}) : super(key: key);

  @override
  _CarerState createState() => _CarerState();
}

class _CarerState extends State<Carer> {
  late Future<List<ImageClass>> _imageData;
  List<String> _items = [];
  String lang='en';
  int _selectedIndex=0;

  @override
  void initState() {
    // TODO: implement initState
    _imageData = getImage(lang);
    super.initState();
  }

  @override

  Widget build(BuildContext context) {
    lang = getLocale(context);
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: new CustomScrollView(
            slivers: [
              pageAppBar(
                  appBarBackground(
                      context,_imageData,_menuBar(width, _items),'carer')),
              pageBody(context,"carer"),
            ],
          )
      ),
    );
  }


  Widget _menuBar(double width, List<String> items){

    return Container(
      height: ScreenUtil().setHeight(90),
      width: width,
      padding: EdgeInsets.only(
          left: 5,
          right: 5
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context,index){
          return InkWell(
            onTap: (){
              setState(() {
                setState(() {
                  _selectedIndex = index;
                });
              });
            },
            child: pageMenuBar(translate(context, items[index]),index,_selectedIndex),
          );
        },
      ),
    );
  }

}
