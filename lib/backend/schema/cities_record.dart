import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CitiesRecord extends FirestoreRecord {
  CitiesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "cityPhoto" field.
  String? _cityPhoto;
  String get cityPhoto => _cityPhoto ?? '';
  bool hasCityPhoto() => _cityPhoto != null;

  // "cityName" field.
  String? _cityName;
  String get cityName => _cityName ?? '';
  bool hasCityName() => _cityName != null;

  // "cityDescription" field.
  String? _cityDescription;
  String get cityDescription => _cityDescription ?? '';
  bool hasCityDescription() => _cityDescription != null;

  // "founded" field.
  int? _founded;
  int get founded => _founded ?? 0;
  bool hasFounded() => _founded != null;

  // "cityPopulation" field.
  int? _cityPopulation;
  int get cityPopulation => _cityPopulation ?? 0;
  bool hasCityPopulation() => _cityPopulation != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  bool hasIndex() => _index != null;

  // "userLiked" field.
  List<DocumentReference>? _userLiked;
  List<DocumentReference> get userLiked => _userLiked ?? const [];
  bool hasUserLiked() => _userLiked != null;

  // "userDisliked" field.
  List<DocumentReference>? _userDisliked;
  List<DocumentReference> get userDisliked => _userDisliked ?? const [];
  bool hasUserDisliked() => _userDisliked != null;

  void _initializeFields() {
    _cityPhoto = snapshotData['cityPhoto'] as String?;
    _cityName = snapshotData['cityName'] as String?;
    _cityDescription = snapshotData['cityDescription'] as String?;
    _founded = castToType<int>(snapshotData['founded']);
    _cityPopulation = castToType<int>(snapshotData['cityPopulation']);
    _index = castToType<int>(snapshotData['index']);
    _userLiked = getDataList(snapshotData['userLiked']);
    _userDisliked = getDataList(snapshotData['userDisliked']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cities');

  static Stream<CitiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CitiesRecord.fromSnapshot(s));

  static Future<CitiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CitiesRecord.fromSnapshot(s));

  static CitiesRecord fromSnapshot(DocumentSnapshot snapshot) => CitiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CitiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CitiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CitiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CitiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCitiesRecordData({
  String? cityPhoto,
  String? cityName,
  String? cityDescription,
  int? founded,
  int? cityPopulation,
  int? index,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cityPhoto': cityPhoto,
      'cityName': cityName,
      'cityDescription': cityDescription,
      'founded': founded,
      'cityPopulation': cityPopulation,
      'index': index,
    }.withoutNulls,
  );

  return firestoreData;
}

class CitiesRecordDocumentEquality implements Equality<CitiesRecord> {
  const CitiesRecordDocumentEquality();

  @override
  bool equals(CitiesRecord? e1, CitiesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.cityPhoto == e2?.cityPhoto &&
        e1?.cityName == e2?.cityName &&
        e1?.cityDescription == e2?.cityDescription &&
        e1?.founded == e2?.founded &&
        e1?.cityPopulation == e2?.cityPopulation &&
        e1?.index == e2?.index &&
        listEquality.equals(e1?.userLiked, e2?.userLiked) &&
        listEquality.equals(e1?.userDisliked, e2?.userDisliked);
  }

  @override
  int hash(CitiesRecord? e) => const ListEquality().hash([
        e?.cityPhoto,
        e?.cityName,
        e?.cityDescription,
        e?.founded,
        e?.cityPopulation,
        e?.index,
        e?.userLiked,
        e?.userDisliked
      ]);

  @override
  bool isValidKey(Object? o) => o is CitiesRecord;
}
