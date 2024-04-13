class CardModel {
  final String logo;
  final String name;
  final String number;
  final String balance;
  final String type;

  CardModel(
      {required this.logo,
      required this.name,
      required this.number,
      required this.balance,
      required this.type});
}

final cards = [
  CardModel(
    logo: 'assets/images/mc.png',
    name: "John Doe",
    number: '1234567890',
    balance: '10,000',
    type: 'black',
  ),
  CardModel(
    logo: 'assets/images/visa.png',
    name: "Jane Smith",
    number: '2345678901',
    balance: '15,000',
    type: 'gold',
  ),
  CardModel(
    logo: 'assets/images/mc.png',
    name: "Bob Johnson",
    number: '3456789012',
    balance: '20,000',
    type: 'blue',
  ),
  CardModel(
    logo: 'assets/images/visa.png',
    name: "Alice Williams",
    number: '4567890123',
    balance: '25,000',
    type: 'red',
  ),
  CardModel(
    logo: 'assets/images/visa.png',
    name: "Charlie Brown",
    number: '5678901234',
    balance: '30,000',
    type: 'black',
  ),
];
