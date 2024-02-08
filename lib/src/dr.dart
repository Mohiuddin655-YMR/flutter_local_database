part of 'db.dart';

/// The class representing a document within a local database.
class LDR {
  /// The key or path of the document.
  final String key;

  /// The reference to the local database containing the document.
  final LocalDatabase database;

  /// Constructor for the LDR class.
  ///
  /// Parameters:
  /// - [key]: The key or path of the document.
  /// - [database]: The reference to the local database.
  const LDR({
    required this.key,
    required this.database,
  });

  /// Method to get a reference to a collection within the document.
  ///
  /// Parameters:
  /// - [path]: The path of the collection within the document.
  ///
  /// Example:
  /// ```dart
  /// LCR subCollectionRef = documentRef.collection('sub_collection');
  /// ```
  LCR collection(String path) => LCR(key: "$key/$path", database: database);

  /// Method to set data in the document.
  ///
  /// Parameters:
  /// - [data]: The data to be set in the document.
  ///
  /// Example:
  /// ```dart
  /// documentRef.set({'name': 'John', 'age': 30});
  /// ```
  void set(Data data) => database._w(key, data);

  /// Method to delete the document.
  ///
  /// Example:
  /// ```dart
  /// documentRef.delete();
  /// ```
  void delete() => database._d(key);

  /// Method to update data in the document.
  ///
  /// Parameters:
  /// - [data]: The data to be updated in the document.
  ///
  /// Example:
  /// ```dart
  /// documentRef.update({'age': 31});
  /// ```
  void update(Data data) => database._u(key, data);

  /// Method to get all data in the document.
  ///
  /// Example:
  /// ```dart
  /// Data documentData = documentRef.get();
  /// ```
  Data get() => database._r(key);
}
