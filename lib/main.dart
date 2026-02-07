import 'package:flutter/material.dart';


void main() {
  runApp(MyAppWidget());
  
}




class MyAppWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My widgets app",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true
        
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("My widgets", style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),),
        backgroundColor: Colors.blue,
        ),

        
        body: Column(
          children: [
            // Widget d'affichage
            Text("Widget d'affichage"),
            SizedBox(height: 10, ),
            Text("Text 2"),
              Divider(height: 10),
              Text("Text 3"),
              Text("Text 4"),
                Divider(height: 10, color: Colors.blue),
              Text("Text 5"),

              Icon(Icons.add_ic_call),
              Icon(Icons.person, size: 50, color: Colors.blueAccent),
              Image.network("https://media.istockphoto.com/id/1458782106/photo/scenic-aerial-view-of-the-mountain-landscape-with-a-forest-and-the-crystal-blue-river-in.jpg?s=612x612&w=0&k=20&c=NXQ_OK6JtmyRRBef8Wd67UZ3scQJKySkXl1ORaActH4=",  width: 50, height: 50),

              Image.asset("images/test.jpg", width: 50, height: 50),
                Divider(height: 10),


                // Widget interactifs

                Text("Widget interactifs", style: TextStyle(fontSize: 50)),

                TextButton(onPressed: () {
                  
                }, child: Text("Mon Bouton")),

                ElevatedButton(onPressed: () {
                  
                }, child: Text("Elevator Button")),

                IconButton(onPressed: () {
                  
                }
                , icon: Icon(Icons.qr_code, size: 30)),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    
                  ),
                )
,
                // Widget en ligne
                Text("Widget en ligne", style: TextStyle(fontSize: 30)),

                Row(children: [
                    Image.network("https://media.istockphoto.com/id/1458782106/photo/scenic-aerial-view-of-the-mountain-landscape-with-a-forest-and-the-crystal-blue-river-in.jpg?s=612x612&w=0&k=20&c=NXQ_OK6JtmyRRBef8Wd67UZ3scQJKySkXl1ORaActH4=",   width: 90,height: 80),
            
            SizedBox(width: 20),
              Image.asset("images/test.jpg", width: 90,height: 80),
           

                ],)

          ],

        )
      )
    );
  }

}