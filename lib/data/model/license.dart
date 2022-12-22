// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

import '../entity/word_entity.dart';

part 'license.g.dart';

@HiveType(typeId: 2)
class License extends WordEntity {
  @override
  @HiveField(0)
  String? name;
  @override
  @HiveField(1)
  String? url;
  License({
    this.name,
    this.url,
  });

  

  License copyWith({
    String? name,
    String? url,
  }) {
    return License(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  factory License.fromMap(Map<String, dynamic> map) {
    return License(
      name: map['name'] != null ? map['name'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory License.fromJson(String source) => License.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'License(name: $name, url: $url)';

  @override
  bool operator ==(covariant License other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
