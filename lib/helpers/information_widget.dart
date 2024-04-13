import 'package:car_rental/common_libs.dart';

class InformationWidget extends StatelessWidget {
  final Icon? icon;
  final String? title;
  final bool? showLoadingBar;
  final String? description;
  final List<Widget> children;
  const InformationWidget({
    Key? key,
    this.icon,
    this.title,
    this.showLoadingBar,
    this.description,
    this.children = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
            left: kDefaultPadding / 2,
            right: kDefaultPadding / 2,
            bottom: kDefaultPadding / 2,
            top: kDefaultPadding / 2),
        child: buildBody(context));
  }

  Column buildBody(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Container(
            width: 80,
            height: 3,
            decoration: BoxDecoration(
              color: context.textColor.withOpacity(.5),
              borderRadius: BorderRadius.circular(
                cornersSmall,
              ),
            ),
          ),
        ),
        verticalSpaceMedium,
        if (showLoadingBar == true) ...[
          Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation(context.textColor)),
            ),
          ),
          verticalSpaceMedium,
        ],
        if (icon != null) ...[
          icon!,
          verticalSpaceMedium,
        ],
        if (title != null) ...[
          Text(
            title!,
            style: context.bodyLarge(),
          ),
          verticalSpaceSmall,
        ],
        if (description != null)
          Text(
            description!,
            textAlign: TextAlign.center,
            style: context.bodyMedium(),
          ),
        ...children,
        verticalSpaceLarge,
        verticalSpaceLarge,
      ],
    );
  }
}
