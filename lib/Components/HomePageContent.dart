import 'package:flutter/material.dart';
import 'package:yencampus/Components/Details.dart';
import 'package:yencampus/Decoration/Fonts.dart';
import 'package:yencampus/Function/HtmlParser.dart';


Widget homepageContent(BuildContext context, final docs, String type){
  return docs.length>0?GridView.builder(
      scrollDirection: Axis.horizontal,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1.15,
          crossAxisSpacing: 5,
          mainAxisSpacing: 10
      ),
      itemCount: docs.length,
      itemBuilder: (context,index)=>Card(
        elevation: 5,
        shadowColor: Colors.grey[300],
        child: InkWell(
          onTap: (){
            Navigator.push(context, new MaterialPageRoute(
                builder: (context)=>Details(doc: docs[index], type: type,isLocal: false,)));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new Container(child: Image.network(
                "${docs[index].images[0]['src']['src']}",
                fit: BoxFit.fill,
              ),),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Text(parseHtmlString(docs[index].description_fr,),
                      style:textStyle, maxLines: 5,
                     overflow: TextOverflow.ellipsis,
                   textAlign: TextAlign.justify,),
                ),
              ),
            ],
          ),
        ),
      )
  ):Container();
}

