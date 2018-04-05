import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'contact_data.dart';

class RandomUserRepository implements ContactRepository {
  static const _kRandomUserUrl = 'http://api.randomuser.me/?results=15';
  final JsonDecoder _decoder = new JsonDecoder();

  @override
  Future<List<Contact>> fetch() {
    // TODO: implement fetch
    return http.get(_kRandomUserUrl).then((http.Response response) {
      final String jsonBody = response.body;
      final statusCode = response.statusCode;

      if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
        throw new FetchDataException(
            "Error while gettting contacts [StatusCode: $statusCode, Error:${response}]");
      }

      final contactsContainer = _decoder.convert(jsonBody);
      final List contactItems = contactsContainer['result'];

      return contactItems
          .map((contactRow) => new Contact.fromMap(contactRow))
          .toList();
    });
  }
}
