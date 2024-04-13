// ignore_for_file: use_build_context_synchronously

import 'dart:math';

import 'package:car_rental/common_libs.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    animation = Tween<double>(
      begin: 0,
      end: 600,
    ).animate(controller);
  }

  proceedToDetails() async {
    controller.forward();

    await Future.delayed(const Duration(milliseconds: 150));

    context.router.push(const DetailsRoute());

    controller.reverse();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Positioned buildCircle2() {
    return Positioned(
      bottom: -context.screenWidth / 1.5,
      child: Container(
        width: context.screenWidth + 200,
        height: context.screenWidth + 200,
        decoration: BoxDecoration(
          color: neutral200.withOpacity(.4),
          shape: BoxShape.circle,
          border: Border.all(
            color: neutral300.withOpacity(.4),
          ),
        ),
      ),
    );
  }

  Positioned buildCircle1() {
    return Positioned(
      top: -200,
      left: -200,
      child: Container(
        width: 400,
        height: 400,
        decoration: BoxDecoration(
          color: neutral100.withOpacity(.4),
          shape: BoxShape.circle,
          border: Border.all(
            color: neutral300.withOpacity(.4),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          buildCircle1().fadeInAndMoveFromTop(
            delay: Duration.zero,
            animationDuration: const Duration(seconds: 3),
          ),
          buildCircle2().fadeInAndMoveFromBottom(
            delay: Duration.zero,
            animationDuration: const Duration(seconds: 3),
          ),
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, animation.value),
                child: child,
              );
            },
            child: buildBody(),
          ),
        ],
      ),
    );
  }

  buildBody() {
    return SafeArea(
        child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(space16),
        child: Column(
          children: [
            buildItem1(),
            verticalSpacer16,
            buildItem2(),
            verticalSpacer16,
            buildItem3(),
            verticalSpacer16,
            builditem4(),
          ],
        ),
      ),
    ));
  }

  Container builditem4() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(space16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF14181C),
              Color(0xFF17191D),
              Color(0xFF171B1F),
              Color(0xFF181D23),
              Color(0xFF1B2026),
              Color(0xFF1D232A),
              Color(0xFF1B2129),
            ]),
        borderRadius: BorderRadius.circular(space32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'SAVED FILTERS',
                style: satoshi500S12.copyWith(
                  color: const Color(0xFFAFA9A9),
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.more_horiz_rounded,
                color: Color(0xFFAFA9A9),
              )
            ],
          ).fadeInAndMoveFromBottom(),
          verticalSpacer16,
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '3 Offers',
                      style: satoshi500S16.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    verticalSpacer8,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.near_me_rounded,
                          color: Color(0xFF7D7878),
                          size: 20,
                        ),
                        Text(
                          '> 500m',
                          style: satoshi500S12.copyWith(
                            color: const Color(0xFFAFA9A9),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        horizontalSpacer16,
                        const Icon(
                          Icons.ev_station_rounded,
                          color: Color(0xFF7D7878),
                          size: 20,
                        ),
                        Text(
                          '> 250m',
                          style: satoshi500S12.copyWith(
                            color: const Color(0xFFAFA9A9),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        horizontalSpacer16,
                        const Icon(
                          Icons.ac_unit_rounded,
                          color: Color(0xFF7D7878),
                          size: 20,
                        ),
                        horizontalSpacer16,
                        const Icon(
                          Icons.flash_on_outlined,
                          color: Color(0xFF7D7878),
                          size: 20,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              horizontalSpacer8,
              Container(
                padding: const EdgeInsets.all(space8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF383C40),
                ),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 16,
                ),
              )
            ],
          ).fadeInAndMoveFromBottom(),
          verticalSpacer8,
          const Divider(
            color: Color(0xFF353C40),
          ).fadeIn(),
          verticalSpacer8,
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '22 Offers',
                      style: satoshi500S16.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    verticalSpacer8,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '< \$6.30/h',
                          style: satoshi500S12.copyWith(
                            color: const Color(0xFFAFA9A9),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        horizontalSpacer16,
                        const Icon(
                          Icons.near_me_rounded,
                          color: Color(0xFF7D7878),
                          size: 20,
                        ),
                        Text(
                          '> 1500m',
                          style: satoshi500S12.copyWith(
                            color: const Color(0xFFAFA9A9),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        horizontalSpacer16,
                        const Icon(
                          Icons.ev_station_rounded,
                          color: Color(0xFF7D7878),
                          size: 20,
                        ),
                        Text(
                          '> 250m',
                          style: satoshi500S12.copyWith(
                            color: const Color(0xFFAFA9A9),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              horizontalSpacer8,
              Container(
                padding: const EdgeInsets.all(space8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF383C40),
                ),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 16,
                ),
              )
            ],
          ).fadeInAndMoveFromBottom(),
          verticalSpacer16,
        ],
      ),
    );
  }

  Row buildItem3() {
    return Row(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            height: 230,
            padding: const EdgeInsets.all(space4 / 2),
            decoration: BoxDecoration(
              color: const Color(0xFFDCE5F0),
              borderRadius: BorderRadius.circular(space32),
            ),
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () => proceedToDetails(),
              child: Container(
                width: double.infinity,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFDCE5F0),
                  borderRadius: BorderRadius.circular(space32),
                ),
                child: Image.asset(
                  'assets/images/drive_map.png',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ).fadeIn(),
              ),
            ),
          ),
        ),
        horizontalSpacer16,
        Expanded(
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              context.router.push(const ProfileRoute());
            },
            child: Container(
              width: double.infinity,
              height: 230,
              padding: const EdgeInsets.all(space16),
              decoration: BoxDecoration(
                color: const Color(0xFFEFEAE4),
                borderRadius: BorderRadius.circular(space32),
              ),
              child: Column(
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/images/avatar_image.png',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      verticalSpacer8,
                      Text(
                        loremIspidiumTitle,
                        style: satoshi500S14.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )),
                  const Divider(
                    color: Color(0xFFE2DEDA),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '\$2,912.',
                          style: satoshi500S16.copyWith(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(text: '56'),
                      ],
                      style: satoshi500S16.copyWith(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    textAlign: TextAlign.center,
                    textScaler: MediaQuery.of(context).textScaler,
                  ),
                ],
              ).fadeInAndMoveFromBottom(),
            ),
          ),
        ),
      ],
    );
  }

  buildItem2() {
    return InkWell(
      splashColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        padding: const EdgeInsets.all(space16),
        decoration: BoxDecoration(
          color: const Color(0xFFFAF1F1),
          borderRadius: BorderRadius.circular(space32),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NEAREST CAR',
              style: satoshi500S12.copyWith(
                color: const Color(0xFFAFA9A9),
              ),
            ).fadeInAndMoveFromBottom(),
            verticalSpacer16,
            Image.asset(
              "assets/images/tesla1.png",
              width: double.infinity,
              fit: BoxFit.fitWidth,
              height: 120,
            ).fadeInAndMoveFromLeft(
              delay: const Duration(milliseconds: 300),
              offset: const Offset(-60, 0),
              animationDuration: const Duration(milliseconds: 300),
            ),
            verticalSpacer16,
            Text(
              'Tesla Model S',
              style: satoshi500S16.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ).fadeInAndMoveFromBottom(),
            verticalSpacer16,
            Row(
              children: [
                Transform.rotate(
                  angle: pi / 2,
                  child: const Icon(
                    Icons.battery_4_bar_rounded,
                    color: Color(0xFF7D7878),
                    size: 20,
                  ),
                ),
                horizontalSpacer4,
                Text(
                  '228 km',
                  style: satoshi500S12.copyWith(
                    color: const Color(0xFFAFA9A9),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                horizontalSpacer16,
                const Icon(
                  Icons.directions_walk_rounded,
                  color: Color(0xFF7D7878),
                  size: 20,
                ),
                Text(
                  '4 min',
                  style: satoshi500S12.copyWith(
                    color: const Color(0xFFAFA9A9),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                horizontalSpacer16,
                const Icon(
                  Icons.ac_unit_rounded,
                  color: Color(0xFF7D7878),
                  size: 20,
                ),
                horizontalSpacer16,
                const Icon(
                  Icons.flash_on_rounded,
                  color: Color(0xFF7D7878),
                  size: 20,
                ),
                const Spacer(),
                Text(
                  '\$10.20/hr',
                  style: satoshi500S12.copyWith(
                    color: const Color(0xFFAFA9A9),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ).fadeInAndMoveFromBottom()
          ],
        ),
      ),
    );
  }

  Row buildItem1() {
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(space16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(space32),
              border: Border.all(
                color: const Color(0xFFECECEC),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.info_outline_rounded,
                  color: Colors.black,
                ),
                horizontalSpacer8,
                Text(
                  'Information',
                  style: satoshi500S14.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ).fadeInAndMoveFromBottom(),
          ),
        ),
        horizontalSpacer16,
        Expanded(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(space16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(space32),
              border: Border.all(
                color: const Color(0xFFECECEC),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.notification_add_outlined,
                  color: Colors.black,
                ),
                horizontalSpacer8,
                Text(
                  'Notifications',
                  style: satoshi500S14.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ).fadeInAndMoveFromBottom(),
          ),
        ),
      ],
    );
  }
}
