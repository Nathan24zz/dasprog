import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';
import 'tab.dart';

void main() => runApp(MaterialApp(
  home: QuoteList(),
));

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

// Jika pakai List secara langsung :
// List<String> quotes = [
//   'Be yourself; everyone else is already taken',
//   'I have nothing to declare except my genius',
//   'The truth is rarely pure and never simple',
// ];

// Jika pakai Class dalam List :
List<Quote> quotes = [
  Quote(author: 'Oscar Wilde', text: 'Be yourself; everyone else is already taken'),
  Quote(author: 'Oscar Wilde', text: 'I have nothing to declare except my genius'),
  Quote(author: 'Oscar Wilde', text: 'The truth is rarely pure and never simple'), 
];

// Jika pakai widget 'card' dgn function :
// Widget quoteTemplate(quote){
//   return Card(
//     margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
//     child: Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Text(
//             quote.text,
//             style: TextStyle(
//               fontSize: 18.0,
//               color: Colors.grey[600],
//             ),
//           ),
//           SizedBox(height: 10.0,),
//           Text(
//             quote.author,
//             style: TextStyle(
//               fontSize: 14.0,
//               color: Colors.grey[800],
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }

class _QuoteListState extends State<QuoteList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awsome Quotes'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.deepOrange,
                  Colors.orangeAccent
                ])
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text('This is tile 1'),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return NewTab();
                }));
              },
            ),
            ListTile(
              title: Text('This is tile 2'),
              onTap: () {},
            ),
            ListTile(
              title: Text('This is tile 3'),
              onTap: () {},
            )
          ],
        ),
      ),
      body: Column(
        // Jika pakai List :
        // children: quotes.map((quote) => Text('$quote')).toList(),

        // Jika pakai Class dlm List :
        // children: quotes.map((quote) => Text('${quote.text} - ${quote.author}')).toList(),

        // Jika pakai widget 'card' dgn function :
        // children: quotes.map((quote) => quoteTemplate(quote)).toList(),

        // Jika pakai widget 'card' dgn Class sendiri (lebih reusable):
        children: quotes.map((quote) => QuoteCard(
          quote: quote,
          delete: () {
            setState(() {
              quotes.remove(quote);
            });
          }
        )).toList(),

      ),
    );
  }
}


