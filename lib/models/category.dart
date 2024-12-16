import 'package:drift/drift.dart';

@DataClassName('Category')
class Categories extends Table {
 IntColumn get id => integer().autoIncrement()();
 TextColumn get name => text().withLength(max: 128)();
 IntColumn get type => integer()();
 DateTimeColumn get createdAT => dateTime()();
 DateTimeColumn get updateAT => dateTime()();
 DateTimeColumn get deletedAT => dateTime().nullable()();
}