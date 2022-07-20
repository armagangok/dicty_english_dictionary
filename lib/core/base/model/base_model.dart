abstract class BaseModel<T> {
  Map<dynamic, Object?> toJson();
  T fromJson(Map<dynamic, dynamic> json);
}
