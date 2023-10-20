import 'package:flutter/material.dart';
import 'package:lumi_ecommerce/provider/provider_classs.dart';
import 'package:lumi_ecommerce/view/cart_screen_widget.dart';
import 'package:provider/provider.dart';
class CartScreen extends StatefulWidget {
   CartScreen({super.key,  this.imagename});
 final  String? imagename;


  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Cart", style: TextStyle(fontSize: 25, color: Colors.black),),
backgroundColor: Colors.white, 
leading: IconButton(onPressed: () {
  Navigator.pop(context);
}, icon: Icon(Icons.arrow_back, color: Colors.black,)),   
elevation: 0,
  
      
      
      ),

      body: ListView.separated(itemBuilder: (context, index) {
        return CartScreenWidget(
          curr_index: index,
          productName: Provider.of<myProvider>(context,).list[index].productimagename,
productPrice: Provider.of<myProvider>(context,).list[index].productPrice,
productQuantity: Provider.of<myProvider>(context,).list[index].productQuantity,
productTitle:Provider.of<myProvider>(context,).list[index].productTitle ,
        );
        
      }, separatorBuilder:(context, index) => Divider(), 
      
      itemCount: Provider.of<myProvider>(context,).list.length),
    );
  }
}

