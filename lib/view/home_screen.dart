import 'package:flutter/material.dart';
import 'package:lumi_ecommerce/view/details_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    List<int> price=[1300, 1000, 1528, 2000, 1100, 1690];

    List<String> names=[
      "Purple Classic Fit",
    "White Classic Fit",
    "Black Slim Fit",
    "Navy Slim Fit",
    "Pink Slim Fit",
    "Pink Fit Check"];



    List<String> myTopBar=["All","Men","Women","Kids","Fashion","New"];
        List<String> dress=["https://imagescdn.louisphilippe.com/img/app/product/9/931775-11836902.jpg?q=75&auto=format&w=387",
        "https://imagescdn.louisphilippe.com/img/app/product/9/922529-11599746.jpg?q=75&auto=format&w=387",
        "https://imagescdn.louisphilippe.com/img/app/product/9/931206-11812825.jpg?q=75&auto=format&w=387",
        "https://imagescdn.louisphilippe.com/img/app/product/8/869615-10337562.jpg?q=75&auto=format&w=387",
        "https://imagescdn.louisphilippe.com/img/app/product/9/901149-11056899.jpg?q=75&auto=format&w=387",
        "https://imagescdn.louisphilippe.com/img/app/product/9/913117-11308748.jpg?q=75&auto=format&w=387"];
    return Scaffold(

body: SafeArea(child: Column(
  children: [

Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
   Padding(
     padding: const EdgeInsets.all(10.0),
     child: Text("Discover", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black)),
   ),
   Padding(
     padding: const EdgeInsets.all(8.0),
     child: Icon(Icons.notification_add, color: Colors.black,),
   ),
  ],

),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

      child: Row(children: [
        Expanded(
          flex: 4,
          child: Container(
    height: 55,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(18),
      color: Colors.grey[200],
    ),
    child: Row(
      children: [
        SizedBox(width: 10,),
        Icon(Icons.search),
        SizedBox(width: 10,),
        Text("Search Anything")
      ],
    ),
        )
        ),
        SizedBox(width: 10),
         Expanded(
          flex: 1,
          child: Container(
            
    height: 55,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(18),
      color: Colors.black,
      
    ),
    child: Icon(Icons.filter_list, color: Colors.white,),
    
        )
        ),


      ],),
    ),
    
    Container(
     height: 55,
      child: ListView.builder(
        itemCount: myTopBar.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Row(
          children: [
            SizedBox(width: 10,),
            Container(
            height: 50,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:index==0? Colors.black:Colors.grey[200],),
            
            child: Text(myTopBar[index], style:index==0? TextStyle(color: Colors.white):TextStyle(color: Colors.black),),
      ),
      SizedBox(width: 10),
          ],
        ),),
    ),
    SizedBox(height: 15,),
    Expanded(child: GridView.builder(
      
      itemCount: dress.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      mainAxisExtent: 270
      ), itemBuilder: (context, index) => 
    Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration( color: Colors.amber,borderRadius: BorderRadius.circular(10))
         ,child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>DetailsScreen(imagename: dress[index], imagetitle:names[index] , mrp: price[index],)   ));
                
              },
              child: Container(
                height: 186,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                  image: DecorationImage(image: NetworkImage(dress[index]),fit: BoxFit.cover),
                  
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
            Container(
              color: Colors.white,
              child: Icon(Icons.favorite_border),
            ), 
            SizedBox(width: 10,)
                      ],
                    )
                  ],
                ),
              ),
            )
          ],

         ),
         ),
         SizedBox(height: 5,),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 8),
           child: Text(names[index], style: TextStyle(fontSize: 18,  fontWeight: FontWeight.bold, color: Colors.black),),
         ),
         SizedBox(height: 5,),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 8),
           child: Text("MRP ${price[index]}", style: TextStyle(fontSize: 14,  fontWeight: FontWeight.w800, color: Colors.grey),),
         )

      ],
    ),))
  ],
)),
    );
  }
}