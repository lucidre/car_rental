import 'package:get/get.dart';
import 'package:car_rental/routing/app_router.dart';

class RouterController extends GetxController {
  final Rx<AppRouter> _router = AppRouter().obs;
  AppRouter get router => _router.value;
}
