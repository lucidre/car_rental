import 'package:car_rental/common_libs.dart';
import 'package:car_rental/models/card/card.dart';
import 'package:car_rental/models/transactions/transactions.dart';
import 'package:car_rental/presenation/profile/item/card_item.dart';
import 'package:car_rental/presenation/profile/item/transaction_item.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(viewportFraction: 0.9);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  buildBody() {
    return Padding(
      padding: const EdgeInsets.only(bottom: space16),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ...buildAvatar(),
            verticalSpacer24,
            ...buildPaymentMethod(),
            ...buildRecentTransactions(),
          ],
        ),
      ),
    );
  }

  List<Widget> buildRecentTransactions() {
    return [
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(
          left: space16,
          right: space16,
        ),
        child: Text(
          'Recent Transactions',
          style: satoshi500S16.copyWith(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      verticalSpacer16,
      ListView.builder(
        itemCount: transactions.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => TransactionItem(
          model: transactions[index],
        ),
      ),
    ];
  }

  buildPaymentMethod() {
    return [
      Padding(
        padding: const EdgeInsets.only(left: space16, right: space16),
        child: Row(
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
            Row(
              children: [
                const Icon(
                  Icons.add_rounded,
                  color: Color(0xFFC7C9CC),
                  size: 16,
                ),
                horizontalSpacer4,
                Text(
                  'Add New',
                  style: satoshi500S14.copyWith(
                    color: const Color(0xFFC7C9CC),
                  ),
                ),
              ],
            ),
          ],
        ),
      ).fadeInAndMoveFromBottom(),
      verticalSpacer8,
      Container(
        width: double.infinity,
        height: 260,
        alignment: Alignment.topLeft,
        child: PageView.builder(
            itemCount: cards.length,
            physics: const BouncingScrollPhysics(),
            padEnds: false,
            controller: controller,
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: controller,
                builder: (_, child) {
                  double value = 1;
                  final card = cards[index];
                  if (controller.position.haveDimensions) {
                    value = controller.page! - index;
                    value = (1 - (value.abs() * 0.4)).clamp(0.0, 1.0);
                  }
                  return CardItem(
                    value: value,
                    card: card,
                  );
                },
              );
            }),
      )
    ];
  }

  buildAvatar() {
    return [
      Container(
        width: 90,
        height: 90,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          avatar,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ).fadeInAndMoveFromBottom(),
      verticalSpacer8,
      Text(
        loremIspidiumTitle,
        style: satoshi500S24.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ).fadeInAndMoveFromBottom(),
      verticalSpacer4,
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.location_pin,
            color: grey1,
            size: 16,
          ),
          horizontalSpacer4,
          Text(
            loremIspidiumTitle,
            style: satoshi500S14.copyWith(color: grey1),
          ),
        ],
      ).fadeInAndMoveFromBottom(),
    ];
  }

  buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: black,
        ),
        onPressed: () => context.router.maybePop(),
      ).fadeInAndMoveFromBottom(),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_horiz_rounded,
            color: black,
          ),
        ).fadeInAndMoveFromBottom()
      ],
    );
  }
}
