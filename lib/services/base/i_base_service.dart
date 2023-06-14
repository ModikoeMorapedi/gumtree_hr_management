abstract class IBaseService<T> {
  Future<T>? getAsync(String? path) {}
  Future<T>? postAsync() {}
}
