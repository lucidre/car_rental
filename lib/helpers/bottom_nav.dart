import 'package:car_rental/common_libs.dart';
import 'package:car_rental/models/bottom_bar/bottom_bar.dart';

class BottomNavBar extends StatelessWidget {
  final List<BottomBarModel> models;
  final int index;
  final Function(int) onUpdate;

  const BottomNavBar(
      {Key? key,
      required this.models,
      required this.index,
      required this.onUpdate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: shadeWhite),
      padding: const EdgeInsets.only(
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 1.5,
        right: (kDefaultPadding / 2),
        left: kDefaultPadding / 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: models
            .map(
              (model) => appBarButtons(model, context),
            )
            .toList(),
      ),
    );
  }

  Widget appBarButtons(
    BottomBarModel model,
    BuildContext context,
  ) {
    bool isSelected = models.indexOf(model) == index;
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        onUpdate(models.indexOf(model));
      },
      child: AnimatedContainer(
        duration: medDuration,
        padding: const EdgeInsets.only(
            left: kDefaultPadding / 5, right: kDefaultPadding / 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IgnorePointer(
              ignoring: true,
              child: AppSvg(
                icon: model.icon,
                size: 24,
                name: model.title,
                color: isSelected ? primary600 : neutral400,
              ),
            ),
            Text(model.title,
                style: satoshi500S12.copyWith(
                    color: isSelected ? neutral800 : neutral400)),
          ],
        ),
      ),
    );
  }
}
