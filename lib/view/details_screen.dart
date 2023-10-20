import 'package:flutter/material.dart';
import 'package:lumi_ecommerce/model/cart_model.dart';
import 'package:lumi_ecommerce/provider/provider_classs.dart';

import 'package:lumi_ecommerce/view/cart.dart';
import 'package:provider/provider.dart';
class DetailsScreen extends StatefulWidget {
   DetailsScreen({super.key, required this.imagename, required this.imagetitle, required this.mrp});
  final String imagename;
  final String imagetitle;
  final int mrp;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  
  @override
  Widget build(BuildContext context) {
    final counter=Provider.of<myProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back, color: Colors.black,)),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));
          }, icon: Icon(Icons.shopping_cart,color: Colors.black,))
        ],
        title: Center(child: Text("Details",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),)),
        elevation: 0,
        backgroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(

          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  height: MediaQuery.of(context).size.height*0.5,
                  
                  decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(widget.imagename), fit: BoxFit.cover)),
                ),
              ),
              
              SizedBox(height: 20,),
              Text(widget.imagetitle, style: TextStyle( fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22),),
              
              SizedBox(height: 5,),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber,),
                  SizedBox(width: 2,),
                  Text("4.5/5 ", style: TextStyle(fontSize:16, fontWeight: FontWeight.bold ), )
                ],
              ),
               SizedBox(height: 15,),
        
              Text("The name says it all, the right size slightly snugs the body leaving enoough room for comfort in the sleeves and waist", textAlign: TextAlign.justify, style: TextStyle(fontSize: 16), ),
              
               SizedBox(height: 10,),
              
               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
Column(
  children: [
        Text("Choose", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            
            children: [
            Container(height: 24,width: 24,color: Colors.black,
            child: Center(
              child: Text("S",
                       
              style: TextStyle(color: Colors.white,),),
            ),
            ),
            SizedBox(width: 5,),
             Container(height: 24,width: 24,color: Colors.black,
            child: Center(
              child: Text("M",
                       
              style: TextStyle(color: Colors.white,),),
            ),
            ),
              SizedBox(width: 5,),
            Container(height: 24,width: 24,color: Colors.black,
            child: Center(
              child: Text("L",
                       
              style: TextStyle(color: Colors.white,),),
            ),
            ),
              SizedBox(width: 5,),
            
            
            ],
          ),
        )
  ],
),
                   Row(mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       Column(
                         children: [
                           Text("Quantity", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        
                    
                
               SizedBox(height: 10,),
               Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      counter.decrement();
                    },
                    child: Icon(Icons.remove_circle, color: Colors.black, size: 27,),
                    
                  ),
                  SizedBox(width: 10,),
                  Text(counter.current_index.toString()),
                  SizedBox(width: 10,),
                  InkWell(
                    onTap: () {
                      counter.increment();
                    },
                    child: Icon(Icons.add_circle, color: Colors.black, size: 27,),
                  ),
        
                ],
               ),
                ],
                       ),
                        ],
                   ),
                ],
               ),
              //  SizedBox(height: 30,),
               Divider(thickness: 3),
               Padding(padding: EdgeInsets.all(9),
               child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("Price: ", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),),
                      Text(widget.mrp.toString(), style: TextStyle(fontSize: 18,color: Colors.red),)
                    ],
                  ),
                  SizedBox(width: 20,),
                  InkWell(onTap: () {
                CartScreen(imagename: widget.imagename, );
                Provider.of<myProvider>(context,listen:false).addCart(CartModel(
                  productPrice: widget.mrp*counter.current_index,
                  productQuantity: counter.current_index,
                  productimagename: widget.imagename,
                  productTitle: widget.imagetitle
                ));
              
              }, child:Container(
                height: 50,
                width: 155,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.black),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
Icon(Icons.shop,color: Colors.white,
),
SizedBox(width: 20,),
Text("Add to Cart", style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              )
                  
                ],
               )
               
               ),
               
              
              
            ],
          ),
        ),
      ),
    );
  }
}