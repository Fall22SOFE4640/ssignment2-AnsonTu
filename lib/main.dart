import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Assignment 2',
    home: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            )
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(context, color, Icons.call, 'CALL'),
        _buildButtonColumn(context, color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(context, color, Icons.share, 'SHARE'),
      ]
    );

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      )
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text('Assignment 2: Home Page'),
        ),
        body: ListView(
          children: [
            Image.asset(
                'images/lake.jpg',
                width: 600,
                height: 240,
                fit: BoxFit.cover
            ),
            titleSection,
            buttonSection,
            textSection
          ],
        )
    );
  }
  
  Column _buildButtonColumn(BuildContext context, Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(iconSize: 24, icon: Icon(icon), color: color,
          onPressed: () {
            switch(label) {
              case 'CALL':
                Fluttertoast.showToast(
                    msg: 'A phone call been made',
                    toastLength: Toast.LENGTH_SHORT
                );
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CallRoute()));
                break;
              case 'ROUTE':
                Fluttertoast.showToast(
                    msg: 'Directions have been opened',
                    toastLength: Toast.LENGTH_SHORT
                );
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const DirectionsRoute()));
                break;
              case 'SHARE':
                Fluttertoast.showToast(
                    msg: 'The location has been shared',
                    toastLength: Toast.LENGTH_SHORT
                );
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ShareRoute()));
                break;
            }
          },),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            )
          )
        )
      ]
    );
  }
}

class CallRoute extends StatelessWidget {
  const CallRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CALL Route')
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Return to Home Page'),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      )
    );
  }
}

class DirectionsRoute extends StatelessWidget {
  const DirectionsRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('DIRECTIONS Route')
        ),
        body: Center(
            child: ElevatedButton(
              child: const Text('Return to Home Page'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
        )
    );
  }
}

class ShareRoute extends StatelessWidget {
  const ShareRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('SHARE Route')
        ),
        body: Center(
            child: ElevatedButton(
              child: const Text('Return to Home Page'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
        )
    );
  }
}