import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  var rating = 0.0;
  TextEditingController emailController = new TextEditingController();


  Widget build(BuildContext context) {
   return MaterialApp(
debugShowCheckedModeBanner: false,

     home: new Scaffold(
       appBar: AppBar(
       iconTheme: IconThemeData(color: Colors.black),
    backgroundColor: Color(0xff1dba9f),
    elevation: 2.0,
    centerTitle: true,
    title: Text("Feedback"
    ,style: TextStyle(color: Colors.black ,fontWeight: FontWeight.bold ),),
    leading: IconButton(
    onPressed: (){},
    icon: Icon(Icons.arrow_back),
    ),
     ),
     body:SingleChildScrollView(
       padding:EdgeInsets.all(10.0),
       child:Column(
         children: <Widget>[
           SizedBox(height: 25.0,),
           Text("How Was Your overall experience ? ",
             style: TextStyle(color: Colors.black ,fontSize: 25.0,fontWeight: FontWeight.bold),),
             Text(" it will help us to serve you better  ",
               style: TextStyle(color: Color(0xffc5c5c5)),),

           SizedBox(height: 25.0,),
           Center(
               child: SmoothStarRating(
                 rating: rating,
                 size: 45,
                 filledIconData: Icons.star,
                 halfFilledIconData: Icons.star_half,
                 defaultIconData: Icons.star_border,
                 starCount: 5,
                 allowHalfRating: false,
                 spacing: 2.0,
                 color: Color(0xfffad055),
                 borderColor:Color(0xffe8e8e8) ,
                 onRatingChanged: (value) {
                   setState(() {
                     rating = value;
                   });
                 },
               )),
           SizedBox(height: 40.0,),
           buildFeedbackForm(),
           SizedBox(height: 100.0,),
           Row(
             children: <Widget>[
               Expanded(
                 child: FlatButton(onPressed:(){
                   print(rating);
                   print(emailController.text);
                 },
                   color: Color(0xff1dba9f),
                   padding:EdgeInsets.all(16.0),
                   child: Text("SUBMIT",style: TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.bold
                   ),),
                 ),
               ),
             ],
           ),
         ],
       ),
     )
   ),);
  }
  buildFeedbackForm(){
    return Container(
      height: 200.0,
      child: Stack(
        children: <Widget>[
          TextField(
            controller: emailController,
            maxLines: 10,
            decoration: InputDecoration(
              hintText: "Please briefly describe the issue",
              hintStyle: TextStyle(
                fontSize: 13.0,
                color: Color(0xffc5c5c5)
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),

              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                border:Border(
                  top: BorderSide(
                    width: 1.0,
                    color: Color(0xffa6a6a6),
                  )
                )
              ),
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffe5e5e5),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.add,color: Color(0xffa5a5a5),
                    ),
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  Text("Upload screenshot (optional)",style:
                    TextStyle(
                      color: Color(0xffc5c5c5),
                    ),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

