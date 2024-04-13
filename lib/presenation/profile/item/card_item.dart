import 'package:car_rental/common_libs.dart';
import 'package:car_rental/models/card/card.dart';

class CardItem extends StatelessWidget {
  final CardModel card;
  final double value;

  const CardItem({
    super.key,
    required this.value,
    required this.card,
  });

  @override
  Widget build(BuildContext context) {
    final height = Curves.easeOut.transform(value) * 200;
    final gradient = card.type == 'gold'
        ? goldColors
        : card.type == 'black'
            ? blackColor
            : card.type == 'red'
                ? redColor
                : blueColor;

    return Center(
      child: Container(
        height: height,
        margin: const EdgeInsets.only(
          right: space8,
          left: space8,
          bottom: space32,
        ),
        padding: const EdgeInsets.all(space16),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(.1),
              offset: const Offset(5, 5),
              spreadRadius: 2,
              blurRadius: 10,
            )
          ],
          borderRadius: BorderRadius.circular(space16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradient,
          ),
        ),
        child: buildBody(),
      ),
    );
  }

  buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          card.logo,
          height: 50,
        ).fadeInAndMoveFromBottom(),
        const Spacer(),
        Text(
          card.name,
          style: satoshi500S14.copyWith(
            color: grey1,
          ),
        ).fadeInAndMoveFromBottom(),
        verticalSpacer8,
        Row(
          children: [
            Text(
              maskString(card.number),
              style: satoshi500S16.copyWith(color: white),
            ),
            horizontalSpacer8,
            const Icon(
              Icons.copy_rounded,
              color: white,
              size: 16,
            ),
            const Spacer(),
            Text(
              '\$${card.balance}',
              style: satoshi500S16.copyWith(
                fontSize: 20,
                color: white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ).fadeInAndMoveFromBottom(),
      ],
    );
  }

  String maskString(String input) {
    if (input.length <= 4) {
      return input;
    } else {
      String masked = '*' * (input.length - 4);
      masked += input.substring(input.length - 4);
      return masked;
    }
  }
}
