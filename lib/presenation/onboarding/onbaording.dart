import 'package:car_rental/common_libs.dart';
import 'package:car_rental/presenation/home/home.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final gradient = [
    const Color(0xFF26282D),
    const Color(0xFF24282C),
    const Color(0xFF1F2124),
    const Color(0xFF22262A),
    const Color(0xFF1F2124),
    const Color(0xFF1D242B),
    const Color(0xFF18191B),
    const Color(0xFF0A0B0B),
    const Color(0xFF0A0B0B),
    const Color(0xFF090A0A),
  ];
  int position = 5;
  Timer? timer;

  void startTimer() {
    const seconds = 4;
    timer = Timer.periodic(const Duration(seconds: seconds), (timer) {
      if (position < 3) {
        position++;
        setState(() {});
      } else {
        position = 0;
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) => AppScaffold(body: buildContent());

  Container buildContent() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradient,
        ),
      ),
      width: double.infinity,
      child: Stack(
        children: [
          buildBackground().fadeInAndMoveFromBottom(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: LayoutBuilder(builder: (context, constraint) {
                  final maxWidth = constraint.maxWidth;
                  final maxHeight = constraint.maxHeight;
                  return Container(
                    height: maxHeight,
                    width: maxWidth,
                    alignment: Alignment.center,
                    child: position == 0
                        ? buildImage4(maxWidth, maxHeight)
                        : position == 1
                            ? buildImage3()
                            : position == 2
                                ? buildImage5(maxWidth, maxHeight)
                                : buildImage1(),
                  );
                }),
              ),
              verticalSpacer16,
              Padding(
                padding: const EdgeInsets.only(
                  left: space16,
                  right: space16,
                ),
                child: Text(
                  'Premium Cars.\nEnjoy the Luxury.',
                  style: satoshi700S32.copyWith(
                    color: shadeWhite,
                    fontSize: 45,
                    height: 1.2,
                  ),
                ),
              ).fadeInAndMoveFromBottom(),
              verticalSpacer16,
              Padding(
                padding: const EdgeInsets.only(
                  left: space16,
                  right: space16,
                ),
                child: Text(
                  'Premium and prestige car at an hourly rent. Experience the thrill at a lowe rate.',
                  style: satoshi500S16.copyWith(
                    color: const Color(0xFF7D7F81),
                  ),
                ),
              ).fadeInAndMoveFromBottom(),
              verticalSpacer16,
              Padding(
                padding: const EdgeInsets.only(
                  left: space16,
                  right: space16,
                ),
                child: AppBtn.from(
                  onPressed: () {
                    /*  context.router.push(
                      CustomPageRoute(),
                    ); */
                    context.router.push(const HomeRoute());
                  },
                  isSecondary: true,
                  text: "Let's Go!",
                ),
              ),
              verticalSpacer32,
            ],
          ),
        ],
      ),
    );
  }

  Opacity buildBackground() {
    return Opacity(
      opacity: 0.015,
      child: Image.asset(
        'assets/images/backgroun1.png',
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  buildImage1() {
    return Transform.scale(
      scale: 2.0,
      alignment: Alignment.bottomCenter,
      child: Image.asset(
        'assets/images/porsche1.png',
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.bottomCenter,
      ).fadeInAndMoveFromLeft(
        delay: const Duration(milliseconds: 100),
        animationDuration: const Duration(milliseconds: 600),
        offset: const Offset(-10, -10),
      ),
    );
  }

  buildImage3() {
    return Transform.scale(
      scale: 1.45,
      alignment: Alignment.bottomCenter,
      child: Image.asset(
        'assets/images/porsche3.png',
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.bottomCenter,
      ).fadeInAndMoveFromTop(
        delay: const Duration(milliseconds: 100),
        animationDuration: const Duration(seconds: 1),
        offset: const Offset(0, -100),
      ),
    );
  }

  buildImage4(double maxWidth, double maxHeight) {
    return Transform.scale(
      scale: 1.6,
      alignment: Alignment.bottomCenter,
      child: Transform.translate(
        offset: Offset((maxWidth / 5), 0),
        child: Image.asset(
          'assets/images/porsche4.png',
          width: maxWidth,
          key: const ObjectKey("image 4"),
          height: maxHeight,
          alignment: Alignment.bottomRight,
        ).fadeInAndMoveFromTopAndRight(
          offset: const Offset(0, 10),
          delay: const Duration(milliseconds: 300),
          animationDuration: const Duration(seconds: 1),
        ),
      ),
    );
  }

  buildImage5(double maxWidth, double maxHeight) {
    return Transform.scale(
        scale: 1.5,
        alignment: Alignment.bottomCenter,
        child: Transform.translate(
          offset: Offset(-(maxWidth / 5), 0),
          child: Image.asset(
            'assets/images/porsche5.png',
            width: maxWidth,
            height: maxHeight,
            key: const ObjectKey("image 5"),
            alignment: Alignment.bottomLeft,
          ).fadeInAndMoveFromTopAndLeft(
            offset: const Offset(0, -10),
            delay: const Duration(milliseconds: 300),
            animationDuration: const Duration(seconds: 1),
          ),
        ));
  }
}

// Example usage:

class CustomPageRoute extends PageRouteBuilder {
  CustomPageRoute()
      : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = Offset(0.0, 0.0);
            var end = Offset(-1.0, 0.0);
            var tween = Tween(begin: begin, end: end);
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
}
