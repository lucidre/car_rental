import 'dart:math';

import 'package:car_rental/common_libs.dart';

class DetailsBody1 extends StatefulWidget {
  final VoidCallback onNext;
  const DetailsBody1({
    super.key,
    required this.onNext,
  });

  @override
  State<DetailsBody1> createState() => _DetailsBody1State();
}

class _DetailsBody1State extends State<DetailsBody1> {
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
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.rotate(
                    angle: pi / 2,
                    child: Icon(
                      Icons.battery_4_bar_rounded,
                      color: white.withOpacity(.7),
                      size: 20,
                    ),
                  ),
                  horizontalSpacer4,
                  Text(
                    '228 km',
                    style: satoshi500S12.copyWith(
                      color: white.withOpacity(.7),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  horizontalSpacer8,
                  Icon(
                    Icons.directions_walk_rounded,
                    color: white.withOpacity(.7),
                    size: 20,
                  ),
                  Text(
                    '4 min',
                    style: satoshi500S12.copyWith(
                      color: white.withOpacity(.7),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ).fadeInAndMoveFromBottom(),
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
        Text(
          'Features',
          style: satoshi500S16.copyWith(
            color: black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ).fadeInAndMoveFromBottom(),
        verticalSpacer16,
        buildVechileFeatures(),
        verticalSpacer16,
        Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(space8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(space16),
                  border: Border.all(color: borderWhite),
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '\$13.75',
                        style: satoshi500S16.copyWith(
                          color: black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(text: '/h'),
                    ],
                    style: satoshi500S16.copyWith(
                      color: black,
                      fontSize: 18,
                    ),
                  ),
                  textAlign: TextAlign.center,
                  textScaler: MediaQuery.of(context).textScaler,
                ),
              ),
            ),
            horizontalSpacer8,
            Expanded(
              child: AppBtn.from(
                borderRadius: space16,
                onPressed: () => widget.onNext.call(),
                isSecondary: false,
                text: "Book Now",
              ),
            )
          ],
        ).fadeInAndMoveFromBottom(),
        verticalSpacer16,
      ],
    );
  }

  buildVechileFeatures() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(space16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(space16),
              border: Border.all(color: borderWhite),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.ac_unit_rounded,
                  color: black,
                  size: 24,
                ).fadeInAndMoveFromBottom(),
                verticalSpacer8,
                Text(
                  'Climate Control',
                  style: satoshi500S16.copyWith(
                    color: black,
                    fontWeight: FontWeight.bold,
                  ),
                ).fadeInAndMoveFromBottom(),
                Text(
                  'Two-zone',
                  style: satoshi500S12.copyWith(
                    color: grey1,
                  ),
                ).fadeInAndMoveFromBottom(),
              ],
            ),
          ),
          horizontalSpacer12,
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(space16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(space16),
              border: Border.all(color: borderWhite),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.speed_rounded,
                  color: black,
                  size: 24,
                ).fadeInAndMoveFromBottom(),
                verticalSpacer8,
                Text(
                  'Acceleration',
                  style: satoshi500S16.copyWith(
                    color: black,
                    fontWeight: FontWeight.bold,
                  ),
                ).fadeInAndMoveFromBottom(),
                Text(
                  '4.2s 0-100km/h',
                  style: satoshi500S12.copyWith(
                    color: grey1,
                  ),
                ).fadeInAndMoveFromBottom(),
              ],
            ),
          ),
          horizontalSpacer12,
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(space16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(space16),
              border: Border.all(color: borderWhite),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.electric_car_rounded,
                  color: black,
                  size: 24,
                ).fadeInAndMoveFromBottom(),
                verticalSpacer8,
                Text(
                  'Electricity',
                  style: satoshi500S16.copyWith(
                    color: black,
                    fontWeight: FontWeight.bold,
                  ),
                ).fadeInAndMoveFromBottom(),
                Text(
                  '80% charged',
                  style: satoshi500S12.copyWith(color: grey1),
                ).fadeInAndMoveFromBottom(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
