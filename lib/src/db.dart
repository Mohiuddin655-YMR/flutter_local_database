part 'cr.dart';

part 'dr.dart';

/// Alias for a map representing data in the database.
typedef Data = Map<String, dynamic>;

/// The main class representing a local database.
class LocalDatabase {
  /// The base map representing the entire local database.
  Map<String, Object?> base = {};

  /// Constructor for the LocalDatabase class.
  ///
  /// Parameters:
  /// - [initial]: Initial data to populate the database (optional).
  LocalDatabase({Map<String, Object?>? initial});

  /// Get a reference to a collection within the database.
  ///
  /// Parameters:
  /// - [path]: The path to the collection.
  ///
  /// Example:
  /// ```dart
  /// LocalDatabase localDB = LocalDatabase();
  /// LCR collectionRef = localDB.collection('users');
  /// ```
  LCR collection(String path) => LCR(key: path, database: this);

  /// Private method to delete data at a specific path in the database.
  ///
  /// Parameters:
  /// - [path]: The path to the data to be deleted.
  ///
  /// Example:
  /// ```dart
  /// localDB._d('users/123');
  /// ```
  void _d(String path) {
    Object? temp = base;
    final segments = path.split('/').where((_) => _.isNotEmpty);
    for (final segment in segments) {
      if (temp is Data && temp.containsKey(segment)) {
        if (segments.last == segment) {
          temp.remove(segment);
        } else {
          temp = temp[segment];
        }
      } else {
        return;
      }
    }
  }

  /// Private method to read data at a specific path in the database.
  ///
  /// Parameters:
  /// - [path]: The path to the data to be read.
  ///
  /// Example:
  /// ```dart
  /// Data userData = localDB._r('users/123');
  /// ```
  Data _r(String path) {
    Object? temp = base;
    final segments = path.split('/').where((_) => _.isNotEmpty);
    for (final segment in segments) {
      if (temp is Data && temp.containsKey(segment)) {
        temp = temp[segment];
      } else {
        return {};
      }
    }

    return temp is Data ? temp : {};
  }

  /// Private method to update data at a specific path in the database.
  ///
  /// Parameters:
  /// - [path]: The path to the data to be updated.
  /// - [value]: The new data to be added or updated.
  ///
  /// Example:
  /// ```dart
  /// localDB._u('users/123', {'name': 'John', 'age': 30});
  /// ```
  void _u(String path, Data value) {
    if (value.isNotEmpty) {
      final current = _r(path);
      current.addAll(value);
      _w(path, current);
    }
  }

  /// Private method to write data at a specific path in the database.
  ///
  /// Parameters:
  /// - [path]: The path to the data to be written.
  /// - [value]: The data to be written.
  ///
  /// Example:
  /// ```dart
  /// localDB._w('users/123', {'name': 'John', 'age': 30});
  /// ```
  void _w(String path, Data value) {
    Object? temp = base;
    final segments = path.split('/').where((_) => _.isNotEmpty);
    for (final segment in segments) {
      if (temp is Data) {
        if (!temp.containsKey(segment)) {
          if (segments.last == segment) {
            temp[segment] = value;
          } else {
            temp = temp[segment] = <String, dynamic>{};
          }
        } else {
          temp = temp[segment];
        }
      }
    }
  }
}
