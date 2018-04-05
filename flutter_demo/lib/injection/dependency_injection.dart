import '../data/contact_data.dart';
import '../data/contact_data_impl.dart';
import '../data/contact_data_mock.dart';

enum Flavor { MOCK, PRO }

class Injector {
  static final Injector _singleton = new Injector._internal();
  static Flavor _flavor;

  factory Injector() {
    return _singleton;
  }

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  Injector._internal();

  ContactRepository get contactRepository {
    switch (_flavor) {
      case Flavor.MOCK:
        return new MockContactRepository();
      default:
        return new RandomUserRepository();
    }
  }
}
