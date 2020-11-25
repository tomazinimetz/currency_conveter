// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrencyAdapter extends TypeAdapter<Currency> {
  @override
  final int typeId = 0;

  @override
  Currency read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Currency(
      base: fields[0] as String,
      rates: (fields[1] as Map)?.cast<String, dynamic>(),
      value: fields[2] as double,
      calculatedValue: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Currency obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.base)
      ..writeByte(1)
      ..write(obj.rates)
      ..writeByte(2)
      ..write(obj.value)
      ..writeByte(3)
      ..write(obj.calculatedValue);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
