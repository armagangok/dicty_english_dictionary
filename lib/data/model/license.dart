import 'dart:convert';

import 'package:hive/hive.dart';
import '../entity/word_entity.dart';

part 'license.g.dart';

@HiveType(typeId: 2)
class License extends WordEntity {
  @override
  @HiveField(0)
  final String? name;
  @override
  @HiveField(1)
  final String? url;

   License({
    this.name,
    this.url,
  });

  factory License.fromMap(Map<String, dynamic> data) => License(
        name: data['name'] as String?,
        url: data['url'] as String?,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [License].
  factory License.fromJson(String data) {
    return License.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [License] to a JSON string.
  String toJson() => json.encode(toMap());

  License copyWith({
    String? name,
    String? url,
  }) {
    return License(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  // factory License.fromMap(Map<String, dynamic> map) {
  //   return License(
  //     name: map['name'] != null ? map['name'] as String : null,
  //     url: map['url'] != null ? map['url'] as String : null,
  //   );
  // }

  // factory License.fromJson(String source) => License.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'License(name: $name, url: $url)';

  @override
  bool operator ==(covariant License other) {
    if (identical(this, other)) return true;

    return other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
