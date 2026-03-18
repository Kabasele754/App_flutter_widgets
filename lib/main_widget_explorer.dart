import 'package:flutter/material.dart';

void main() {
  runApp(const WidgetExplorerApp());
}

class WidgetExplorerApp extends StatelessWidget {
  const WidgetExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ STRUCTURE : MaterialApp (racine de l'app)
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Widget Explorer',
      theme: ThemeData(useMaterial3: true),
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
  // ✅ ÉTAT (State) : une donnée qui change
  int counter = 0;
  String message = "Clique sur le bouton pour interagir";

  @override
  Widget build(BuildContext context) {
    // ✅ STRUCTURE : Scaffold (structure d'une page)
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
            title: "1) Widgets de STRUCTURE",
            subtitle: "Ex: MaterialApp, Scaffold, AppBar",
          ),
          const _InfoCard(
            text:
                "Ces widgets donnent la structure globale de l’app et de la page.\n"
                "Ici : MaterialApp (app) + Scaffold (page) + AppBar (barre du haut).",
          ),

          const SizedBox(height: 16),

          const _SectionTitle(
            title: "2) Widgets de MISE EN PAGE (Layout)",
            subtitle: "Ex: Row, Column, Padding, SizedBox, Expanded",
          ),
          const _InfoCard(
            text:
                "Les widgets de layout servent à placer/aligner/espacer les éléments.",
          ),
          const SizedBox(height: 10),
          _LayoutDemo(),

          const SizedBox(height: 16),

          const _SectionTitle(
            title: "3) Widgets d’AFFICHAGE (Display)",
            subtitle: "Ex: Text, Icon, Image, Divider",
          ),
          const _InfoCard(
            text: "Ils affichent des informations visibles à l’écran.",
          ),
          const SizedBox(height: 10),
          _DisplayDemo(),

          const SizedBox(height: 16),

          const _SectionTitle(
            title: "4) Widgets d’INTERACTION",
            subtitle: "Ex: ElevatedButton, IconButton, TextField, GestureDetector",
          ),
          const _InfoCard(
            text: "Ils permettent à l’utilisateur d’agir (cliquer, saisir, toucher).",
          ),
          const SizedBox(height: 10),
          _InteractionDemo(
            counter: counter,
            message: message,
            onIncrement: () {
              setState(() {
                counter++;
                message = "Tu as cliqué $counter fois ✅";
              });
            },
            onReset: () {
              setState(() {
                counter = 0;
                message = "Compteur réinitialisé 🔄";
              });
            },
            onMessageChanged: (value) {
              setState(() {
                message = value.isEmpty ? "Texte vide" : value;
              });
            },
          ),

          const SizedBox(height: 16),

          const _SectionTitle(
            title: "5) Widgets de DÉCORATION / STYLE",
            subtitle: "Ex: Container, Card, BoxDecoration",
          ),
          const _InfoCard(
            text: "Ils servent à embellir : couleurs, bordures, arrondis, ombres.",
          ),
          const SizedBox(height: 10),
          const _DecorationDemo(),

          const SizedBox(height: 20),

          const _SectionTitle(
            title: "Questions (à rendre)",
            subtitle: "Répondre par écrit",
          ),
          const _QuestionsBox(),
        ],
      ),
    );
  }
}

// ==============================
// COMPOSANTS REUTILISABLES
// ==============================
class _SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SectionTitle({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(subtitle, style: const TextStyle(fontSize: 13)),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String text;
  const _InfoCard({required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(text),
      ),
    );
  }
}

// ==============================
// 2) Layout demo
// ==============================
class _LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Exemple Layout : Row + Expanded + SizedBox"),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text("Bloc A (Expanded)"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text("Bloc B (Expanded)"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text("👉 Row aligne horizontalement, Column verticalement."),
          ],
        ),
      ),
    );
  }
}

// ==============================
// 3) Display demo
// ==============================
class _DisplayDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Texte (Text) : Bonjour Flutter", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.star, size: 28),
                SizedBox(width: 8),
                Text("Icône (Icon)"),
              ],
            ),
            SizedBox(height: 10),
            Divider(),
            Text("Divider sépare visuellement les sections."),
          ],
        ),
      ),
    );
  }
}

// ==============================
// 4) Interaction demo
// ==============================
class _InteractionDemo extends StatelessWidget {
  final int counter;
  final String message;
  final VoidCallback onIncrement;
  final VoidCallback onReset;
  final ValueChanged<String> onMessageChanged;

  const _InteractionDemo({
    required this.counter,
    required this.message,
    required this.onIncrement,
    required this.onReset,
    required this.onMessageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Compteur : $counter", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text("Message : $message"),
            const SizedBox(height: 12),

            // TextField : saisie utilisateur
            TextField(
              decoration: const InputDecoration(
                labelText: "Tape un message",
                border: OutlineInputBorder(),
              ),
              onChanged: onMessageChanged,
            ),

            const SizedBox(height: 12),

            // Boutons : interactions
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onIncrement,
                    child: const Text("Incrémenter"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: onReset,
                    child: const Text("Reset"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ==============================
// 5) Decoration demo
// ==============================
class _DecorationDemo extends StatelessWidget {
  const _DecorationDemo();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Text(
            "Container + BoxDecoration : bordure + arrondis.\n"
            "👉 Les décorations servent à rendre l’UI plus propre.",
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}

// ==============================
// Questions à rendre
// ==============================
class _QuestionsBox extends StatelessWidget {
  const _QuestionsBox();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("1) Citez 3 widgets de structure utilisés dans ce projet."),
            SizedBox(height: 6),
            Text("2) Quel widget aligne horizontalement ? Quel widget aligne verticalement ?"),
            SizedBox(height: 6),
            Text("3) Donnez 2 widgets d’affichage et 2 widgets d’interaction vus ici."),
            SizedBox(height: 6),
            Text("4) Pourquoi a-t-on utilisé StatefulWidget dans cette app ?"),
            SizedBox(height: 6),
            Text("5) Expliquez à quoi sert setState() en une phrase."),
          ],
        ),
      ),
    );
  }
}