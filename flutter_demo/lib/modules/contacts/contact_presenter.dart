import '../../data/contact_data.dart';
import '../../injection/dependency_injection.dart';

abstract class ContactListViewContact {
  void onLoadContactsComplete(List<Contact> items);
  void onLoadContactsError();
}

class ContactListPresenter {
  ContactListViewContact _view;
  ContactRepository _repository;

  ContactListPresenter(this._view) {
    _repository = new Injector().contactRepository;
  }

  void loadContacts() {
    assert(_view != null);

    _repository
        .fetch()
        .then((contact) => _view.onLoadContactsComplete(contact))
        .catchError((onError) {
      print(onError);
      _view.onLoadContactsError();
    });
  }
}
