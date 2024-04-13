import 'package:car_rental/models/card/card.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final RxList<CardModel> _cards = <CardModel>[].obs;
  List<CardModel> get cards => _cards;

  addCard(CardModel card) {
    _cards.add(card);
    _cards.refresh();
  }
}
