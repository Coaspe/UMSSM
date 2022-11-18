import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class SUser {
  const SUser({
    required this.name,
    required this.email,
    required this.userId,
    this.accountType = AccountType.email,
    this.password,
    this.profileImg,
  });
  final String name;
  final String email;
  final String userId;
  final String? password;
  final String? profileImg;
  final AccountType accountType;

  /// Empty user which represents an unauthenticated user.
  static const empty = SUser(email: '', userId: '', name: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == SUser.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != SUser.empty;
  factory SUser.fromJson(Map<String, dynamic> json) => _$SUserFromJson(json);
  Map<String, dynamic> toJson() => _$SUserToJson(this);
}

enum AccountType { email, google, kakao }
