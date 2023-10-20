import 'package:flutter/material.dart';
import 'package:lumi_ecommerce/view/bottom_navigation.dart';


class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.85,
                  decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: NetworkImage("https://guesswatches.com/cdn/shop/files/GW_Home_2Up_1400x1400_F23_Mens_Headline.jpg?v=1696252280&width=493"))),
                
                ),
                Column(
                  children: [
                    Text("Define", style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold, color: Colors.black ),
                    ),
                    Text("Your", style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold, color: Colors.black )),
                    Text("Style", style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold, color: Colors.black ))
                  ],
                )
              ],
            ),
            Divider(thickness: 3,),
            Container(width: 300,
              child: ElevatedButton(
                 style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomBar(),));
                }, child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Get Started", style: TextStyle(color: Colors.white),
                   
                    ),
                     SizedBox(width: 10,),
                    Icon(Icons.arrow_forward),
                  ],
                )),
            )
          ],
        ),
      ),
    );
  }
}