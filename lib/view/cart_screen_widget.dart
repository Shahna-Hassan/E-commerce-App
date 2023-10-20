
import 'package:flutter/material.dart';
import 'package:lumi_ecommerce/provider/provider_classs.dart';
import 'package:provider/provider.dart';

class CartScreenWidget extends StatelessWidget {
  final int curr_index;
  final String productName;
  final String productTitle;
  final int productQuantity;
  final int productPrice;


  const CartScreenWidget({
    super.key,
    required this.curr_index,
    required this.productName,
    required this.productTitle,
    required this.productQuantity,
    required this.productPrice
  });

  @override
  Widget build(BuildContext context) {
    final counter=Provider.of<myProvider>(context);
    return Container(
      height: 150,
      width: double.infinity,
child:Row(
  children: [
    Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
    image: DecorationImage(image: NetworkImage(productName), fit: BoxFit.cover),

      
      ),
    ),
    SizedBox(width: 10,),
    Padding(padding: EdgeInsets.only(left: 20, top: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          
          child: Text(
            softWrap: true,
            productTitle, style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        SizedBox(height: 10,),
        Text(
          "Total Price: $productPrice ",
          style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text("Quantity: $productQuantity"),
        Container(
          width: 180,
          child: 
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap:() {
                   counter.deleteCart(curr_index);
                },
                child: Icon(Icons.delete),

              ),
              
            ],
          ),
        )
      ],
    ),
    )
  ],
)


    );
  }
}