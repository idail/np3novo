import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeadCaptureRecord extends FirestoreRecord {
  LeadCaptureRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "companyName" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  bool hasCompanyName() => _companyName != null;

  void _initializeFields() {
    _companyName = snapshotData['companyName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('leadCapture');

  static Stream<LeadCaptureRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LeadCaptureRecord.fromSnapshot(s));

  static Future<LeadCaptureRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LeadCaptureRecord.fromSnapshot(s));

  static LeadCaptureRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LeadCaptureRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LeadCaptureRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LeadCaptureRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LeadCaptureRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LeadCaptureRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLeadCaptureRecordData({
  String? companyName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'companyName': companyName,
    }.withoutNulls,
  );

  return firestoreData;
}

class LeadCaptureRecordDocumentEquality implements Equality<LeadCaptureRecord> {
  const LeadCaptureRecordDocumentEquality();

  @override
  bool equals(LeadCaptureRecord? e1, LeadCaptureRecord? e2) {
    return e1?.companyName == e2?.companyName;
  }

  @override
  int hash(LeadCaptureRecord? e) => const ListEquality().hash([e?.companyName]);

  @override
  bool isValidKey(Object? o) => o is LeadCaptureRecord;
}
