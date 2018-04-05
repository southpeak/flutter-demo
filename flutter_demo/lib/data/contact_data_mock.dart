
import 'dart:async';
import 'contact_data.dart';

class MockContactRepository implements ContactRepository {
  @override
    Future<List<Contact>> fetch() {
      // TODO: implement fetch
      return new Future.value(kContacts);
    }
}

const kContacts = const <Contact>[
  const Contact(
    fullName: 'Romain Hoogmoed',
    email: 'romain.hoogmed@example.com'
  ),
  const Contact(
    fullName: 'Emilie Olsen',
    email: 'emilie.olsen@example.com'
  )
];
