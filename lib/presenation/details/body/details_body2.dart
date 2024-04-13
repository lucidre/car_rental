import 'package:car_rental/common_libs.dart';
import 'package:car_rental/models/card/card.dart';

class DetailsBody2 extends StatefulWidget {
  final VoidCallback onPrevious;
  const DetailsBody2({
    super.key,
    required this.onPrevious,
  });

  @override
  State<DetailsBody2> createState() => _DetailsBody2State();
}

class _DetailsBody2State extends State<DetailsBody2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: blackColor),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(space16),
          topRight: Radius.circular(space16),
        ),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 100,
                width: double.infinity,
                padding: const EdgeInsets.all(space16),
                alignment: Alignment.topLeft,
                child: buildVehicleName(),
              ),
              Container(
                padding: const EdgeInsets.all(space16),
                decoration: const BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(space16),
                    topRight: Radius.circular(space16),
                  ),
                ),
                child: buildVehicleDetails(),
              ),
            ],
          ),
          Positioned(
            right: space4,
            top: 0,
            child: Image.asset(
              porsche1,
              width: 300,
              fit: BoxFit.contain,
              height: 200,
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }

  buildVehicleName() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Tesla Model S',
                style: satoshi500S16.copyWith(
                  color: white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ).fadeInAndMoveFromBottom(),
              verticalSpacer8,
              InkWell(
                splashColor: Colors.transparent,
                onTap: () => widget.onPrevious.call(),
                child: Row(
                  children: [
                    Text(
                      'About Car',
                      style: satoshi500S12.copyWith(
                        color: grey1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    horizontalSpacer4,
                    const Icon(
                      Icons.arrow_right_alt_rounded,
                      color: grey1,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        horizontalSpacer8,
        InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            context.router.maybePop();
          },
          child: Container(
            padding: const EdgeInsets.all(space4),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF383C40),
            ),
            child: const Icon(
              Icons.close_rounded,
              color: white,
              size: 20,
            ),
          ),
        ).fadeInAndMoveFromBottom(),
      ],
    );
  }

  Column buildVehicleDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpacer32,
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '06:28',
                  style: satoshi700S32.copyWith(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Free waiting, then \$15/h',
                  style: satoshi500S12.copyWith(
                    color: grey1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.only(
                left: space24,
                right: space24,
                top: space12,
                bottom: space12,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFEAE3E3),
                borderRadius: BorderRadius.circular(space32),
              ),
              child: Text(
                'End Rent',
                style: satoshi500S12.copyWith(
                  color: const Color(0xFF813838),
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ).fadeInAndMoveFromBottom(),
        verticalSpacer32,
        context.divider,
        verticalSpacer32,
        Row(
          children: [
            Text(
              'Payment Method',
              style: satoshi500S16.copyWith(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Text(
              'Change',
              style: satoshi500S14.copyWith(
                color: const Color(0xFFC7C9CC),
              ),
            ),
          ],
        ).fadeInAndMoveFromBottom(),
        verticalSpacer16,
        Container(
          padding: const EdgeInsets.only(
            left: space24,
            right: space8,
            top: space8,
            bottom: space8,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFEFF1F4),
            borderRadius: BorderRadius.circular(space12),
          ),
          child: Row(
            children: [
              Text(
                maskString(cards.first.number),
                style: satoshi500S16.copyWith(),
              ),
              const Spacer(),
              Image.asset(
                cards.first.logo,
                height: 30,
              ).fadeInAndMoveFromBottom(),
            ],
          ),
        ).fadeInAndMoveFromBottom(),
        verticalSpacer32,
        context.divider,
        verticalSpacer32,
        Row(
          children: [
            const Icon(
              Icons.power_settings_new_rounded,
              color: black,
            ),
            horizontalSpacer8,
            Text(
              'Start Engine',
              style: satoshi700S24.copyWith(
                fontSize: 20,
                color: black,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.volume_up_rounded,
              color: black,
            ),
            horizontalSpacer8,
            Text(
              'Beep Sound',
              style: satoshi700S24.copyWith(
                fontSize: 20,
                color: black,
              ),
            ),
          ],
        ).fadeInAndMoveFromBottom(),
        verticalSpacer32,
        AppBtn.from(
          borderRadius: space16,
          icon: Icons.lock_rounded,
          onPressed: () {},
          isSecondary: false,
          text: "Open The Car",
        ),
        verticalSpacer32,
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
