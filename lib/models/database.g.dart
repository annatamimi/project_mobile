// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
      'type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdATMeta =
      const VerificationMeta('createdAT');
  @override
  late final GeneratedColumn<DateTime> createdAT = GeneratedColumn<DateTime>(
      'created_a_t', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updateATMeta =
      const VerificationMeta('updateAT');
  @override
  late final GeneratedColumn<DateTime> updateAT = GeneratedColumn<DateTime>(
      'update_a_t', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedATMeta =
      const VerificationMeta('deletedAT');
  @override
  late final GeneratedColumn<DateTime> deletedAT = GeneratedColumn<DateTime>(
      'deleted_a_t', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, type, createdAT, updateAT, deletedAT];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('created_a_t')) {
      context.handle(
          _createdATMeta,
          createdAT.isAcceptableOrUnknown(
              data['created_a_t']!, _createdATMeta));
    } else if (isInserting) {
      context.missing(_createdATMeta);
    }
    if (data.containsKey('update_a_t')) {
      context.handle(_updateATMeta,
          updateAT.isAcceptableOrUnknown(data['update_a_t']!, _updateATMeta));
    } else if (isInserting) {
      context.missing(_updateATMeta);
    }
    if (data.containsKey('deleted_a_t')) {
      context.handle(
          _deletedATMeta,
          deletedAT.isAcceptableOrUnknown(
              data['deleted_a_t']!, _deletedATMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!,
      createdAT: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_a_t'])!,
      updateAT: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}update_a_t'])!,
      deletedAT: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_a_t']),
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String name;
  final int type;
  final DateTime createdAT;
  final DateTime updateAT;
  final DateTime? deletedAT;
  const Category(
      {required this.id,
      required this.name,
      required this.type,
      required this.createdAT,
      required this.updateAT,
      this.deletedAT});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<int>(type);
    map['created_a_t'] = Variable<DateTime>(createdAT);
    map['update_a_t'] = Variable<DateTime>(updateAT);
    if (!nullToAbsent || deletedAT != null) {
      map['deleted_a_t'] = Variable<DateTime>(deletedAT);
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      createdAT: Value(createdAT),
      updateAT: Value(updateAT),
      deletedAT: deletedAT == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAT),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<int>(json['type']),
      createdAT: serializer.fromJson<DateTime>(json['createdAT']),
      updateAT: serializer.fromJson<DateTime>(json['updateAT']),
      deletedAT: serializer.fromJson<DateTime?>(json['deletedAT']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<int>(type),
      'createdAT': serializer.toJson<DateTime>(createdAT),
      'updateAT': serializer.toJson<DateTime>(updateAT),
      'deletedAT': serializer.toJson<DateTime?>(deletedAT),
    };
  }

  Category copyWith(
          {int? id,
          String? name,
          int? type,
          DateTime? createdAT,
          DateTime? updateAT,
          Value<DateTime?> deletedAT = const Value.absent()}) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        createdAT: createdAT ?? this.createdAT,
        updateAT: updateAT ?? this.updateAT,
        deletedAT: deletedAT.present ? deletedAT.value : this.deletedAT,
      );
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      createdAT: data.createdAT.present ? data.createdAT.value : this.createdAT,
      updateAT: data.updateAT.present ? data.updateAT.value : this.updateAT,
      deletedAT: data.deletedAT.present ? data.deletedAT.value : this.deletedAT,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('createdAT: $createdAT, ')
          ..write('updateAT: $updateAT, ')
          ..write('deletedAT: $deletedAT')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, type, createdAT, updateAT, deletedAT);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.createdAT == this.createdAT &&
          other.updateAT == this.updateAT &&
          other.deletedAT == this.deletedAT);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> type;
  final Value<DateTime> createdAT;
  final Value<DateTime> updateAT;
  final Value<DateTime?> deletedAT;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.createdAT = const Value.absent(),
    this.updateAT = const Value.absent(),
    this.deletedAT = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int type,
    required DateTime createdAT,
    required DateTime updateAT,
    this.deletedAT = const Value.absent(),
  })  : name = Value(name),
        type = Value(type),
        createdAT = Value(createdAT),
        updateAT = Value(updateAT);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? type,
    Expression<DateTime>? createdAT,
    Expression<DateTime>? updateAT,
    Expression<DateTime>? deletedAT,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (createdAT != null) 'created_a_t': createdAT,
      if (updateAT != null) 'update_a_t': updateAT,
      if (deletedAT != null) 'deleted_a_t': deletedAT,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? type,
      Value<DateTime>? createdAT,
      Value<DateTime>? updateAT,
      Value<DateTime?>? deletedAT}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      createdAT: createdAT ?? this.createdAT,
      updateAT: updateAT ?? this.updateAT,
      deletedAT: deletedAT ?? this.deletedAT,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (createdAT.present) {
      map['created_a_t'] = Variable<DateTime>(createdAT.value);
    }
    if (updateAT.present) {
      map['update_a_t'] = Variable<DateTime>(updateAT.value);
    }
    if (deletedAT.present) {
      map['deleted_a_t'] = Variable<DateTime>(deletedAT.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('createdAT: $createdAT, ')
          ..write('updateAT: $updateAT, ')
          ..write('deletedAT: $deletedAT')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, Transaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _category_idMeta =
      const VerificationMeta('category_id');
  @override
  late final GeneratedColumn<int> category_id = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _transaction_dateMeta =
      const VerificationMeta('transaction_date');
  @override
  late final GeneratedColumn<DateTime> transaction_date =
      GeneratedColumn<DateTime>('transaction_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdATMeta =
      const VerificationMeta('createdAT');
  @override
  late final GeneratedColumn<DateTime> createdAT = GeneratedColumn<DateTime>(
      'created_a_t', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updateATMeta =
      const VerificationMeta('updateAT');
  @override
  late final GeneratedColumn<DateTime> updateAT = GeneratedColumn<DateTime>(
      'update_a_t', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedATMeta =
      const VerificationMeta('deletedAT');
  @override
  late final GeneratedColumn<DateTime> deletedAT = GeneratedColumn<DateTime>(
      'deleted_a_t', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        category_id,
        transaction_date,
        amount,
        createdAT,
        updateAT,
        deletedAT
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(Insertable<Transaction> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _category_idMeta,
          category_id.isAcceptableOrUnknown(
              data['category_id']!, _category_idMeta));
    } else if (isInserting) {
      context.missing(_category_idMeta);
    }
    if (data.containsKey('transaction_date')) {
      context.handle(
          _transaction_dateMeta,
          transaction_date.isAcceptableOrUnknown(
              data['transaction_date']!, _transaction_dateMeta));
    } else if (isInserting) {
      context.missing(_transaction_dateMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('created_a_t')) {
      context.handle(
          _createdATMeta,
          createdAT.isAcceptableOrUnknown(
              data['created_a_t']!, _createdATMeta));
    } else if (isInserting) {
      context.missing(_createdATMeta);
    }
    if (data.containsKey('update_a_t')) {
      context.handle(_updateATMeta,
          updateAT.isAcceptableOrUnknown(data['update_a_t']!, _updateATMeta));
    } else if (isInserting) {
      context.missing(_updateATMeta);
    }
    if (data.containsKey('deleted_a_t')) {
      context.handle(
          _deletedATMeta,
          deletedAT.isAcceptableOrUnknown(
              data['deleted_a_t']!, _deletedATMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Transaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Transaction(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      category_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      transaction_date: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}transaction_date'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      createdAT: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_a_t'])!,
      updateAT: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}update_a_t'])!,
      deletedAT: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_a_t']),
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }
}

class Transaction extends DataClass implements Insertable<Transaction> {
  final int id;
  final String name;
  final int category_id;
  final DateTime transaction_date;
  final int amount;
  final DateTime createdAT;
  final DateTime updateAT;
  final DateTime? deletedAT;
  const Transaction(
      {required this.id,
      required this.name,
      required this.category_id,
      required this.transaction_date,
      required this.amount,
      required this.createdAT,
      required this.updateAT,
      this.deletedAT});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['category_id'] = Variable<int>(category_id);
    map['transaction_date'] = Variable<DateTime>(transaction_date);
    map['amount'] = Variable<int>(amount);
    map['created_a_t'] = Variable<DateTime>(createdAT);
    map['update_a_t'] = Variable<DateTime>(updateAT);
    if (!nullToAbsent || deletedAT != null) {
      map['deleted_a_t'] = Variable<DateTime>(deletedAT);
    }
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      name: Value(name),
      category_id: Value(category_id),
      transaction_date: Value(transaction_date),
      amount: Value(amount),
      createdAT: Value(createdAT),
      updateAT: Value(updateAT),
      deletedAT: deletedAT == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAT),
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Transaction(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      category_id: serializer.fromJson<int>(json['category_id']),
      transaction_date: serializer.fromJson<DateTime>(json['transaction_date']),
      amount: serializer.fromJson<int>(json['amount']),
      createdAT: serializer.fromJson<DateTime>(json['createdAT']),
      updateAT: serializer.fromJson<DateTime>(json['updateAT']),
      deletedAT: serializer.fromJson<DateTime?>(json['deletedAT']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'category_id': serializer.toJson<int>(category_id),
      'transaction_date': serializer.toJson<DateTime>(transaction_date),
      'amount': serializer.toJson<int>(amount),
      'createdAT': serializer.toJson<DateTime>(createdAT),
      'updateAT': serializer.toJson<DateTime>(updateAT),
      'deletedAT': serializer.toJson<DateTime?>(deletedAT),
    };
  }

  Transaction copyWith(
          {int? id,
          String? name,
          int? category_id,
          DateTime? transaction_date,
          int? amount,
          DateTime? createdAT,
          DateTime? updateAT,
          Value<DateTime?> deletedAT = const Value.absent()}) =>
      Transaction(
        id: id ?? this.id,
        name: name ?? this.name,
        category_id: category_id ?? this.category_id,
        transaction_date: transaction_date ?? this.transaction_date,
        amount: amount ?? this.amount,
        createdAT: createdAT ?? this.createdAT,
        updateAT: updateAT ?? this.updateAT,
        deletedAT: deletedAT.present ? deletedAT.value : this.deletedAT,
      );
  Transaction copyWithCompanion(TransactionsCompanion data) {
    return Transaction(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      category_id:
          data.category_id.present ? data.category_id.value : this.category_id,
      transaction_date: data.transaction_date.present
          ? data.transaction_date.value
          : this.transaction_date,
      amount: data.amount.present ? data.amount.value : this.amount,
      createdAT: data.createdAT.present ? data.createdAT.value : this.createdAT,
      updateAT: data.updateAT.present ? data.updateAT.value : this.updateAT,
      deletedAT: data.deletedAT.present ? data.deletedAT.value : this.deletedAT,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category_id: $category_id, ')
          ..write('transaction_date: $transaction_date, ')
          ..write('amount: $amount, ')
          ..write('createdAT: $createdAT, ')
          ..write('updateAT: $updateAT, ')
          ..write('deletedAT: $deletedAT')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, category_id, transaction_date,
      amount, createdAT, updateAT, deletedAT);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.id == this.id &&
          other.name == this.name &&
          other.category_id == this.category_id &&
          other.transaction_date == this.transaction_date &&
          other.amount == this.amount &&
          other.createdAT == this.createdAT &&
          other.updateAT == this.updateAT &&
          other.deletedAT == this.deletedAT);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> category_id;
  final Value<DateTime> transaction_date;
  final Value<int> amount;
  final Value<DateTime> createdAT;
  final Value<DateTime> updateAT;
  final Value<DateTime?> deletedAT;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.category_id = const Value.absent(),
    this.transaction_date = const Value.absent(),
    this.amount = const Value.absent(),
    this.createdAT = const Value.absent(),
    this.updateAT = const Value.absent(),
    this.deletedAT = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int category_id,
    required DateTime transaction_date,
    required int amount,
    required DateTime createdAT,
    required DateTime updateAT,
    this.deletedAT = const Value.absent(),
  })  : name = Value(name),
        category_id = Value(category_id),
        transaction_date = Value(transaction_date),
        amount = Value(amount),
        createdAT = Value(createdAT),
        updateAT = Value(updateAT);
  static Insertable<Transaction> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? category_id,
    Expression<DateTime>? transaction_date,
    Expression<int>? amount,
    Expression<DateTime>? createdAT,
    Expression<DateTime>? updateAT,
    Expression<DateTime>? deletedAT,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (category_id != null) 'category_id': category_id,
      if (transaction_date != null) 'transaction_date': transaction_date,
      if (amount != null) 'amount': amount,
      if (createdAT != null) 'created_a_t': createdAT,
      if (updateAT != null) 'update_a_t': updateAT,
      if (deletedAT != null) 'deleted_a_t': deletedAT,
    });
  }

  TransactionsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? category_id,
      Value<DateTime>? transaction_date,
      Value<int>? amount,
      Value<DateTime>? createdAT,
      Value<DateTime>? updateAT,
      Value<DateTime?>? deletedAT}) {
    return TransactionsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      category_id: category_id ?? this.category_id,
      transaction_date: transaction_date ?? this.transaction_date,
      amount: amount ?? this.amount,
      createdAT: createdAT ?? this.createdAT,
      updateAT: updateAT ?? this.updateAT,
      deletedAT: deletedAT ?? this.deletedAT,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category_id.present) {
      map['category_id'] = Variable<int>(category_id.value);
    }
    if (transaction_date.present) {
      map['transaction_date'] = Variable<DateTime>(transaction_date.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (createdAT.present) {
      map['created_a_t'] = Variable<DateTime>(createdAT.value);
    }
    if (updateAT.present) {
      map['update_a_t'] = Variable<DateTime>(updateAT.value);
    }
    if (deletedAT.present) {
      map['deleted_a_t'] = Variable<DateTime>(deletedAT.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category_id: $category_id, ')
          ..write('transaction_date: $transaction_date, ')
          ..write('amount: $amount, ')
          ..write('createdAT: $createdAT, ')
          ..write('updateAT: $updateAT, ')
          ..write('deletedAT: $deletedAT')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [categories, transactions];
}

typedef $$CategoriesTableCreateCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  required String name,
  required int type,
  required DateTime createdAT,
  required DateTime updateAT,
  Value<DateTime?> deletedAT,
});
typedef $$CategoriesTableUpdateCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int> type,
  Value<DateTime> createdAT,
  Value<DateTime> updateAT,
  Value<DateTime?> deletedAT,
});

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDb, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAT => $composableBuilder(
      column: $table.createdAT, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updateAT => $composableBuilder(
      column: $table.updateAT, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAT => $composableBuilder(
      column: $table.deletedAT, builder: (column) => ColumnFilters(column));
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDb, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAT => $composableBuilder(
      column: $table.createdAT, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updateAT => $composableBuilder(
      column: $table.updateAT, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAT => $composableBuilder(
      column: $table.deletedAT, builder: (column) => ColumnOrderings(column));
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDb, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAT =>
      $composableBuilder(column: $table.createdAT, builder: (column) => column);

  GeneratedColumn<DateTime> get updateAT =>
      $composableBuilder(column: $table.updateAT, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAT =>
      $composableBuilder(column: $table.deletedAT, builder: (column) => column);
}

class $$CategoriesTableTableManager extends RootTableManager<
    _$AppDb,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (Category, BaseReferences<_$AppDb, $CategoriesTable, Category>),
    Category,
    PrefetchHooks Function()> {
  $$CategoriesTableTableManager(_$AppDb db, $CategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> type = const Value.absent(),
            Value<DateTime> createdAT = const Value.absent(),
            Value<DateTime> updateAT = const Value.absent(),
            Value<DateTime?> deletedAT = const Value.absent(),
          }) =>
              CategoriesCompanion(
            id: id,
            name: name,
            type: type,
            createdAT: createdAT,
            updateAT: updateAT,
            deletedAT: deletedAT,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int type,
            required DateTime createdAT,
            required DateTime updateAT,
            Value<DateTime?> deletedAT = const Value.absent(),
          }) =>
              CategoriesCompanion.insert(
            id: id,
            name: name,
            type: type,
            createdAT: createdAT,
            updateAT: updateAT,
            deletedAT: deletedAT,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CategoriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDb,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (Category, BaseReferences<_$AppDb, $CategoriesTable, Category>),
    Category,
    PrefetchHooks Function()>;
typedef $$TransactionsTableCreateCompanionBuilder = TransactionsCompanion
    Function({
  Value<int> id,
  required String name,
  required int category_id,
  required DateTime transaction_date,
  required int amount,
  required DateTime createdAT,
  required DateTime updateAT,
  Value<DateTime?> deletedAT,
});
typedef $$TransactionsTableUpdateCompanionBuilder = TransactionsCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<int> category_id,
  Value<DateTime> transaction_date,
  Value<int> amount,
  Value<DateTime> createdAT,
  Value<DateTime> updateAT,
  Value<DateTime?> deletedAT,
});

class $$TransactionsTableFilterComposer
    extends Composer<_$AppDb, $TransactionsTable> {
  $$TransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get category_id => $composableBuilder(
      column: $table.category_id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get transaction_date => $composableBuilder(
      column: $table.transaction_date,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAT => $composableBuilder(
      column: $table.createdAT, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updateAT => $composableBuilder(
      column: $table.updateAT, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAT => $composableBuilder(
      column: $table.deletedAT, builder: (column) => ColumnFilters(column));
}

class $$TransactionsTableOrderingComposer
    extends Composer<_$AppDb, $TransactionsTable> {
  $$TransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get category_id => $composableBuilder(
      column: $table.category_id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get transaction_date => $composableBuilder(
      column: $table.transaction_date,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAT => $composableBuilder(
      column: $table.createdAT, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updateAT => $composableBuilder(
      column: $table.updateAT, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAT => $composableBuilder(
      column: $table.deletedAT, builder: (column) => ColumnOrderings(column));
}

class $$TransactionsTableAnnotationComposer
    extends Composer<_$AppDb, $TransactionsTable> {
  $$TransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get category_id => $composableBuilder(
      column: $table.category_id, builder: (column) => column);

  GeneratedColumn<DateTime> get transaction_date => $composableBuilder(
      column: $table.transaction_date, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAT =>
      $composableBuilder(column: $table.createdAT, builder: (column) => column);

  GeneratedColumn<DateTime> get updateAT =>
      $composableBuilder(column: $table.updateAT, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAT =>
      $composableBuilder(column: $table.deletedAT, builder: (column) => column);
}

class $$TransactionsTableTableManager extends RootTableManager<
    _$AppDb,
    $TransactionsTable,
    Transaction,
    $$TransactionsTableFilterComposer,
    $$TransactionsTableOrderingComposer,
    $$TransactionsTableAnnotationComposer,
    $$TransactionsTableCreateCompanionBuilder,
    $$TransactionsTableUpdateCompanionBuilder,
    (Transaction, BaseReferences<_$AppDb, $TransactionsTable, Transaction>),
    Transaction,
    PrefetchHooks Function()> {
  $$TransactionsTableTableManager(_$AppDb db, $TransactionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> category_id = const Value.absent(),
            Value<DateTime> transaction_date = const Value.absent(),
            Value<int> amount = const Value.absent(),
            Value<DateTime> createdAT = const Value.absent(),
            Value<DateTime> updateAT = const Value.absent(),
            Value<DateTime?> deletedAT = const Value.absent(),
          }) =>
              TransactionsCompanion(
            id: id,
            name: name,
            category_id: category_id,
            transaction_date: transaction_date,
            amount: amount,
            createdAT: createdAT,
            updateAT: updateAT,
            deletedAT: deletedAT,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int category_id,
            required DateTime transaction_date,
            required int amount,
            required DateTime createdAT,
            required DateTime updateAT,
            Value<DateTime?> deletedAT = const Value.absent(),
          }) =>
              TransactionsCompanion.insert(
            id: id,
            name: name,
            category_id: category_id,
            transaction_date: transaction_date,
            amount: amount,
            createdAT: createdAT,
            updateAT: updateAT,
            deletedAT: deletedAT,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TransactionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDb,
    $TransactionsTable,
    Transaction,
    $$TransactionsTableFilterComposer,
    $$TransactionsTableOrderingComposer,
    $$TransactionsTableAnnotationComposer,
    $$TransactionsTableCreateCompanionBuilder,
    $$TransactionsTableUpdateCompanionBuilder,
    (Transaction, BaseReferences<_$AppDb, $TransactionsTable, Transaction>),
    Transaction,
    PrefetchHooks Function()>;

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
}
