import 'package:flutter/material.dart';
import './injection/dependency_injection.dart';

import 'modules/contacts/contact_view.dart';

// Injector.configure(Flavor.PRO);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new MaterialApp(
        home: new ContactsPage(),
      );
    }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//       // TODO: implement build
//       return new MaterialApp(
//         home: new DefaultTabController(
//           length: 3,
//           child: new Scaffold(
//             appBar: new AppBar(
//               bottom: new TabBar(
//                 tabs: [
//                   new Tab(icon: new Icon(Icons.directions_car)),
//                   new Tab(icon: new Icon(Icons.directions_transit)),
//                   new Tab(icon: new Icon(Icons.directions_bike)),
//                 ],
//               ),
//               title: new Text('Root'),
//             ),
//             body: new TabBarView(
//               children: <Widget>[
//                 new Icon(Icons.directions_car),
//                 new Icon(Icons.directions_transit),
//                 new Icon(Icons.directions_bike),
//               ],
//             ),
//           ),
//         ),
//       );
//     }
// }