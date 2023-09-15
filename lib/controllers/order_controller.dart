import 'package:get/get.dart';
import 'package:pettie_admin/models/order_model.dart' as order;



import '../services/database_services.dart';

class OrderController extends GetxController {
  final DatabaseService database = DatabaseService();

  var orders = <order.Order>[].obs;
  var pendingOrders = <order.Order>[].obs;

  @override
  void onInit() {
    orders.bindStream(database.getOrders());
    pendingOrders.bindStream(database.getPendingOrders());
    super.onInit();
  }

  void updateOrder(
    order.Order order,
    String field,
    bool value,
  ) {
    database.updateOrder(order, field, value);
  }
}