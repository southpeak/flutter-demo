
import 'package:flutter/material.dart';
import '../../data/contact_data.dart';
import 'contact_presenter.dart';

class ContactsPage extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Contacts"),
        ),
        body: new ContactList(),
      );
    }
}

class ContactList extends StatefulWidget {
  ContactList({ Key key}) : super(key: key);

  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return new _ContactListState();
    }
}

class _ContactListState extends State<ContactList> implements ContactListViewContact {
  ContactListPresenter _presenter;

  List<Contact> _contacts;

  bool _isSearching;

  _ContactListState() {
    _presenter = new ContactListPresenter(this);
  }

  @override
  void initState() {
    super.initState();

    _isSearching = true;
    _presenter.loadContacts();
  }

  @override
  void onLoadContactsComplete(List<Contact> items) {
    setState(() {
      _contacts = items;
      _isSearching = false;
    });
  }

  @override
  void onLoadContactsError() {
    print("error");
  }

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      Widget widget;

      if (_isSearching) {
        widget = new Center(
          child: new Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: new CircularProgressIndicator(),
          ),
        );
      } else {
        widget = new ListView.builder(
          padding: new EdgeInsets.all(8.0),
          itemExtent: 20.0,
          itemBuilder: (BuildContext context, int index) {
            return new Text(_contacts[index].fullName);
          },
          itemCount: _contacts.length,
        );
      }
    }
}