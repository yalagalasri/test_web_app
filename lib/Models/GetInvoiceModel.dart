import 'package:cloud_firestore/cloud_firestore.dart';

class GetInvoiceModel {
  String? url;
  Timestamp? timestamp;
  bool? status;

  GetInvoiceModel({this.url, this.timestamp, this.status});
}
