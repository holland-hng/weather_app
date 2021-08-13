// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherEntityAdapter extends TypeAdapter<WeatherEntity> {
  @override
  final int typeId = 0;

  @override
  WeatherEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherEntity(
      weatherStateName: fields[0] as String,
      weatherStateAbbr: fields[1] as String,
      windDirectionCompass: fields[2] as String,
      created: fields[3] as String,
      applicableDate: fields[4] as String,
      minTemp: fields[5] as double,
      maxTemp: fields[6] as double,
      theTemp: fields[7] as double,
      windSpeed: fields[8] as double,
      windDirection: fields[9] as double,
      airPressure: fields[10] as double,
      humidity: fields[11] as int,
      visibility: fields[12] as double,
      predictability: fields[13] as int,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherEntity obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.weatherStateName)
      ..writeByte(1)
      ..write(obj.weatherStateAbbr)
      ..writeByte(2)
      ..write(obj.windDirectionCompass)
      ..writeByte(3)
      ..write(obj.created)
      ..writeByte(4)
      ..write(obj.applicableDate)
      ..writeByte(5)
      ..write(obj.minTemp)
      ..writeByte(6)
      ..write(obj.maxTemp)
      ..writeByte(7)
      ..write(obj.theTemp)
      ..writeByte(8)
      ..write(obj.windSpeed)
      ..writeByte(9)
      ..write(obj.windDirection)
      ..writeByte(10)
      ..write(obj.airPressure)
      ..writeByte(11)
      ..write(obj.humidity)
      ..writeByte(12)
      ..write(obj.visibility)
      ..writeByte(13)
      ..write(obj.predictability);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
