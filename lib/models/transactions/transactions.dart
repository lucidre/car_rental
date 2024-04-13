class Transaction {
  final String date;
  final String amount;
  final String vechile;
  final String time;

  Transaction(
      {required this.date,
      required this.amount,
      required this.vechile,
      required this.time});
}

final transactions = [
  Transaction(
    date: '10 April, 5:00 am',
    amount: '103.23',
    vechile: 'Tesla Model 3',
    time: '0h 10m 40s',
  ),
  Transaction(
    date: '5 April, 2:00 pm',
    amount: '53.34',
    vechile: 'Toyota Camry',
    time: '1h 10m 40s',
  ),
  Transaction(
    date: '1 April, 5:00 am',
    amount: '303.53',
    vechile: 'Chevrolet Malibu',
    time: '2h 5m 40s',
  ),
  Transaction(
    date: '24 March, 8:00 am',
    amount: '563.53',
    vechile: 'Honda Accord',
    time: '3h 10m 40s',
  ),
  Transaction(
    date: '20 March, 8:00 am',
    amount: '53.53',
    vechile: 'BMW 3 Series',
    time: '0h 10m 40s',
  ),
  Transaction(
    date: '10 March, 5:00 am',
    amount: '103.23',
    vechile: 'Tesla Model 3',
    time: '0h 10m 40s',
  ),
  Transaction(
    date: '21 Febuary, 2:00 pm',
    amount: '53.34',
    vechile: 'Toyota Camry',
    time: '1h 10m 40s',
  ),
  Transaction(
    date: '11 Febuary, 5:00 am',
    amount: '303.53',
    vechile: 'Chevrolet Malibu',
    time: '2h 5m 40s',
  ),
  Transaction(
    date: '5 Febuary, 8:00 am',
    amount: '563.53',
    vechile: 'Honda Accord',
    time: '3h 10m 40s',
  ),
  Transaction(
    date: '1 Febuary, 8:00 am',
    amount: '53.53',
    vechile: 'BMW 3 Series',
    time: '0h 10m 40s',
  ),
];
