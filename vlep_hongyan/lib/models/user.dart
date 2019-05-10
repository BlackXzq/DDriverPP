
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
@immutable
class UserEntity {
   int userId;
   String token;
   String username;
   int type;
   int customerType;

  UserEntity({
    this.userId = -1,
    this.token = '',
    this.username = '',
    this.type = -1,
    this.customerType = -1
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

}
