import 'package:car_rental/common_libs.dart';
import 'package:car_rental/presenation/details/body/details_body1.dart';
import 'package:car_rental/presenation/details/body/details_body2.dart';

@RoutePage()
class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isSecondPage = false;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          buildBackground().fadeInAndMoveFromBottom(),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: buildAppbar(),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: buildBody(),
          )
        ],
      ),
    );
  }

  buildAppbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          context.router.maybePop();
        },
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: black,
        ),
      ).fadeInAndMoveFromBottom(),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.pages_rounded,
            color: black,
          ),
        ).fadeInAndMoveFromBottom(),
      ],
    );
  }

  Widget buildBackground() {
    return Opacity(
      opacity: .6,
      child: Image.asset(
        mapLarge,
        width: context.screenWidth,
        height: context.screenHeight,
        fit: BoxFit.cover,
      ),
    );
  }

  buildBody() {
    return isSecondPage
        ? DetailsBody2(
            onPrevious: () {
              setState(() {
                isSecondPage = false;
              });
            },
          )
        : DetailsBody1(
            onNext: () {
              setState(() {
                isSecondPage = true;
              });
            },
          );
  }
}
