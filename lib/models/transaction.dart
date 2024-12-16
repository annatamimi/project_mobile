import 'package:drift/drift.dart';

class Transactions extends Table {
 IntColumn get id => integer().autoIncrement()();
 TextColumn get name => text().withLength(max: 128)();
 IntColumn get category_id => integer()();
 DateTimeColumn get transaction_date => dateTime()();
 IntColumn get amount => integer()();



 DateTimeColumn get createdAT => dateTime()();
 DateTimeColumn get updateAT => dateTime()();
 DateTimeColumn get deletedAT => dateTime().nullable()();
}