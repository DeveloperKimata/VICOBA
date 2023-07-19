import 'package:hive/hive.dart';
part 'add_date.g.dart';

@HiveType(typeId: 1)
class Add_data extends HiveObject {
  @HiveField(0)
  String Select_payment_type;
  @HiveField(1)
  String explain;
  @HiveField(2)
  String Amount;
  @HiveField(3)
  String Select_transaction_type;
  @HiveField(4)
  DateTime datetime;
  Add_data(this.Select_transaction_type, this.Amount, this.datetime, this.explain, this.Select_payment_type);
}
