import 'package:flutter/material.dart';

import '../models/trip.dart';
import '../shared/heart.dart';

class Details extends StatelessWidget {
  final Trip trip;
  const Details({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
                child: Hero(
              tag: trip.img,
              child: Image.asset(
                'images/${trip.img}',
                height: 360,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            )),
            SizedBox(height: 30),
            ListTile(
                title: Text(trip.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey[800])),
                subtitle: Text(
                    '${trip.nights} night stay for only \$${trip.price}',
                    style: TextStyle(letterSpacing: 1)),
                trailing: Heart()),
            Padding(
                padding: EdgeInsets.all(18),
                child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ante enim, elementum at viverra id, maximus vel leo. Donec gravida rhoncus ipsum lacinia auctor. Suspendisse potenti. Nam interdum nisl eget tellus ultrices, et posuere arcu egestas. Nam non nisi sed urna placerat lacinia. Nullam pulvinar dui at elementum vestibulum. Mauris vitae augue nec metus convallis rhoncus a ut lorem. Nullam sed urna quis orci accumsan convallis id eu magna. Proin at sem quis turpis eleifend eleifend. Quisque eget augue venenatis, varius nisl ac, tempus massa. Ut dignissim finibus eros eu tincidunt. Nulla eget rutrum velit. Morbi non hendrerit velit. Nulla vel justo ornare enim cursus aliquam et ut est..',
                    style: TextStyle(color: Colors.grey[600], height: 1.4))),
          ],
        ));
  }
}
// adb connect 127.0.0.1:21503
