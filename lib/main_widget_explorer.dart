
import 'package:flutter/material.dart';

void main() {

  runApp(const WidgetExplorerApp());
  
}

class WidgetExplorerApp extends StatelessWidget {
  const WidgetExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Widget Explorer",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,),
        home: const WidgetExplorerPage(),
    );
  }
}


class WidgetExplorerPage extends StatefulWidget {
  const WidgetExplorerPage({super.key});

  @override
  State<WidgetExplorerPage> createState() => _WidgetExplorerPageState();
}

class _WidgetExplorerPageState extends State<WidgetExplorerPage> {
  int counter = 0;
  String message = "Clique sur le boutton pour interagir";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.access_alarm), 
            SizedBox(width: 6,),
            Text("Widget Explorer", style: TextStyle(
          color: Colors.blueAccent,
          fontSize: 28,
          // backgroundColor: const Color.fromARGB(255, 49, 55, 58),
          
        ),),
          ],
        ),
        centerTitle: true,
        leadingWidth: 80,
        // leading: Row(
        //   children: [
        //     Icon(Icons.menu), 
        //     SizedBox(width: 6,),
        //     Icon(Icons.notifications)
        //   ],
        // )

        leading: Padding(padding: EdgeInsets.all(8),
            child:  Image.asset("assets/images/test.jpg", width: 50, height: 50),
        ),
        
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          const _SectionTitle(

              title:  "1. Widgets de stucture",
              subtitle: "Ex: Material, Scaffold, AppBar",
          ), 

          const _InfoCard(
            text: "Ces widgets donnent la structure global de l'app et de la page. \n"
            "Ici MaterialApp (app) + Scafold (page) + AppBar (barre du haut)"
            ,
          ),

            const _SectionTitle(

              title:  "2. Widgets de Mise en page (Layout)",
              subtitle: "Ex: Row, Column, Padding, SizedBox, Expended",
          ), 

          const _InfoCard(
            text: "Ces widgets de layout servent a la placer/aligner/espacer les elemnts"
            ,
          ),
          

          const _LayoutDemo(),

          SizedBox(height: 16,),
           const _SectionTitle(

              title:  "3. Widgets d'affichage (Display)",
              subtitle: "Ex: Text, Icon, Image, Divider",
          ), 

          const _InfoCard(
            text: "Ces widgets perment d'afficher des information visible sur l'ecaran"
            ,
          ),

          SizedBox(height: 10,

          
          ), 

          const _DispayDemo(),

         SizedBox(height: 16,),
           const _SectionTitle(

              title:  "4. Widgets d'interaction",
              subtitle: "Ex: ElevatedButton, IconButton, TextField, GestureDetector",
          ), 

          const _InfoCard(
            text: "Ces widgets permentent a l'utilisateus d'agir (cliquer, saisir, toucher)"
            ,
          ),

          SizedBox(height: 10,),

           _InteractionDemo(
            counter: counter,
            message: message,
            onIncremnt: () {
              setState(() {
                counter++;
                message ="Tu as clique $counter fois";
              });
            },
            onReset: () {
              setState(() {
                counter =0;
                message ="Compteur reinitialiser";
              });
            },

            onMessageChanged: (value) {
              setState(() {
                message = value.isEmpty ? "Texte vide":value;
              });
              
            },



          )
        ],

      ),

    );
  }
}





class _SectionTitle extends StatelessWidget {

  final String title;
  final String subtitle;
  const _SectionTitle({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          
        ),
        SizedBox(height: 4,),

         Text(
          subtitle, style: TextStyle(fontSize: 13),
          
        ),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String text;
  const _InfoCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,

      child: Padding(padding: const EdgeInsets.all(12), child: Text(text,),),
    );
  }
}



class _LayoutDemo extends StatelessWidget {
  const _LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(padding: EdgeInsets.all(12),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Exemple Layout : Row + Expended + SizedBox"),
          const SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                child: 
              Container(
                
                padding: EdgeInsets.all(12),
               
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(10),
                   color: Colors.white,
                ),
                child: const Text("Bloc A (Expanded)"),
              )
              ), 

              SizedBox(width: 10,),

               Expanded(
                child: 
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(
                     color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(10),
                   color: Colors.white,
                ),
                child: const Text("Bloc B (Expanded)"),
              )
              ), 
              
            ],
          ),

          const SizedBox(height: 10,),
          const Text("Row aligne horizitalemnt, Column vertcalemnt")


        ],

      ),
      ),
    );
  }
}


class _DispayDemo extends StatelessWidget {
  const _DispayDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(padding: EdgeInsets.all(12),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Texte (Text) : Bonjour Flutter", style: TextStyle(fontSize: 16),),
          SizedBox(height: 8,),
          Row(
            children: [
              Icon(
                Icons.star, size: 28,
              ),
              SizedBox(width: 8,),
              Text("Icone (Icon)")
            ],
          ),
          SizedBox(height: 10,),

          Row(
            children: [
                        Image.network("https://media.istockphoto.com/id/1458782106/photo/scenic-aerial-view-of-the-mountain-landscape-with-a-forest-and-the-crystal-blue-river-in.jpg?s=612x612&w=0&k=20&c=NXQ_OK6JtmyRRBef8Wd67UZ3scQJKySkXl1ORaActH4=",  width: 100, height: 50),

                        Text("Image (Image)")
            ],
          )
        ],
      ),),
    );
  }
}



class _InteractionDemo extends StatelessWidget {
  final int counter;
  final String message;
  final VoidCallback onIncremnt;
  final VoidCallback onReset;
  final ValueChanged<String> onMessageChanged;

  const _InteractionDemo({
    super.key, required 
    this.counter, 
    required 
    this.message, 
    required this.onIncremnt,
    required this.onReset,
    required this.onMessageChanged
    });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Compteur : $counter", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          SizedBox(height: 8,),
          Text("Message : $message"),
          SizedBox(height: 12,),
          TextField(
            decoration: InputDecoration(
              labelText: "Tape un message",
              border: OutlineInputBorder()
            ),
            onChanged: onMessageChanged,
          ),
          SizedBox(height: 12,),

          Row(
            children: [
              Expanded(child: ElevatedButton(onPressed: onIncremnt, child: Text("Incrementer"))),
              SizedBox(width: 10,),
              Expanded(child: OutlinedButton(onPressed: onReset, child: Text("Reset")))
            ],
          )


        ],
      ),),
    );
  }
}