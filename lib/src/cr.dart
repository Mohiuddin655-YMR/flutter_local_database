part of 'db.dart';

/// The class representing a collection within a local database.
class LCR {
  /// The key or path of the collection.
  final String key;

  /// The reference to the local database containing the collection.
  final LocalDatabase database;

  /// Getter to obtain the ID for the next document in the collection.
  String get id => "${length + 1}";

  /// Getter to obtain the number of documents in the collection.
  int get length => get().length;

  /// Constructor for the LCR class.
  ///
  /// Parameters:
  /// - [key]: The key or path of the collection.
  /// - [database]: The reference to the local database.
  const LCR({
    required this.key,
    required this.database,
  });

  /// Method to get a reference to a document within the collection.
  ///
  /// Parameters:
  /// - [path]: The path or ID of the document within the collection.
  ///
  /// Example:
  /// ```dart
  /// LDR userDocument = collectionRef.document('123');
  /// ```
  LDR document(String path) => LDR(key: "$key/$path", database: database);

  /// Method to add a new document to the collection.
  ///
  /// Parameters:
  /// - [data]: The data to be added to the new document.
  ///
  /// Example:
  /// ```dart
  /// collectionRef.add({'name': 'John', 'age': 30});
  /// ```
  void add(Data data) => set(id, data);

  /// Method to set data in a specific document within the collection.
  ///
  /// Parameters:
  /// - [id]: The ID or path of the document to be updated.
  /// - [data]: The data to be set in the document.
  ///
  /// Example:
  /// ```dart
  /// collectionRef.set('123', {'name': 'John', 'age': 31});
  /// ```
  void set(String id, Data data) => document(id).set(data);

  /// Method to delete a document from the collection.
  ///
  /// Parameters:
  /// - [id]: The ID or path of the document to be deleted.
  ///
  /// Example:
  /// ```dart
  /// collectionRef.delete('123');
  /// ```
  void delete(String id) => document(id).delete();

  /// Method to update data in a specific document within the collection.
  ///
  /// Parameters:
  /// - [id]: The ID or path of the document to be updated.
  /// - [data]: The data to be updated in the document.
  ///
  /// Example:
  /// ```dart
  /// collectionRef.update('123', {'age': 32});
  /// ```
  void update(String id, Data data) => document(id).update(data);

  /// Method to get all documents in the collection.
  ///
  /// Example:
  /// ```dart
  /// Iterable<Data> allDocuments = collectionRef.get();
  /// ```
  Iterable<Data> get() => database._r(key).values.whereType<Data>();
}
