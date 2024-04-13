import 'package:car_rental/common_libs.dart';
import 'package:car_rental/models/transactions/transactions.dart';

class TransactionItem extends StatelessWidget {
  final Transaction model;
  const TransactionItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(
        left: space16,
        right: space16,
        bottom: space8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                model.date,
                style: satoshi500S14.copyWith(
                  color: black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                '-\$${model.amount}',
                style: satoshi500S14.copyWith(
                  color: black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ).fadeInAndMoveFromBottom(),
          verticalSpacer4,
          Row(
            children: [
              Text(
                model.vechile,
                style: satoshi500S12.copyWith(
                  color: grey1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              horizontalSpacer4,
              Container(
                width: 5,
                height: 5,
                decoration: const BoxDecoration(
                  color: grey1,
                  shape: BoxShape.circle,
                ),
              ),
              horizontalSpacer4,
              Text(
                model.time,
                style: satoshi500S12.copyWith(
                  color: grey1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ).fadeInAndMoveFromBottom(),
        ],
      ),
    );
  }
}
