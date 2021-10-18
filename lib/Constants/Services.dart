import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_web_app/Constants/reusable.dart';

FirebaseFirestore _firestore = FirebaseFirestore.instance;
var ntime = DateTime.now().toString().split(" ")[0];

class QueryServices {
  static Query newqry =
      _firestore.collection("Tasks").where("cat", isEqualTo: "NEW");
  static Query prosqry =
      _firestore.collection("Tasks").where("cat", isEqualTo: "PROSPECT");
  static Query inpro =
      _firestore.collection("Tasks").where("cat", isEqualTo: "IN PROGRESS");
  static Query wonqry =
      _firestore.collection("Tasks").where("cat", isEqualTo: "WON");
  static Query clsqry =
      _firestore.collection("Tasks").where("cat", isEqualTo: "CLOSE");
}

class UpdateServices {
  static lastseenUpdate(id) async {
    CollectionReference collectionReference = _firestore.collection("Tasks");
    collectionReference.doc(id).update({
      "lastseen": Timestamp.now(),
    });
  }
}

class CatUpdateServices {
  static updateCat(id) async {
    CollectionReference collectionReference = _firestore.collection("Tasks");
    collectionReference.doc(id).update({
      "cat": "PROSPECT",
    });
  }

  static updateCat1(id) async {
    CollectionReference collectionReference = _firestore.collection("Tasks");
    collectionReference.doc(id).update({
      "cat": "IN PROGRESS",
    });
  }

  static updateCat3(id) async {
    CollectionReference collectionReference = _firestore.collection("Tasks");
    collectionReference.doc(id).update({
      "cat": "WON",
    });
  }

  static updateCat4(id) async {
    CollectionReference collectionReference = _firestore.collection("Tasks");
    collectionReference.doc(id).update({
      "cat": "CLOSE",
    });
  }
}

class StatusUpdateServices {
  // new status update here...
  static updateStatus(id, stat1) async {
    CollectionReference collectionReference = _firestore.collection("Tasks");
    collectionReference.doc(id).update({
      "status": stat1.toString(),
    });
  }

  static statusget(String newsta) {
    if (newsta == "CONTACTED") {
      return "CONTACTED";
    }
    if (newsta == "ASSIGNED") {
      return "ASSIGNED";
    } else {
      return "FRESH";
    }
  }

  static Color statcolorget(String newres) {
    if (newres == "CONTACTED") {
      return conClr;
    } else if (newres == "ASSIGNED") {
      return flwClr;
    } else {
      return wonClr;
    }
  }

  //Status updated here... 2
  static updateStatus1(id, stat2) async {
    CollectionReference collectionReference = _firestore.collection("Tasks");
    collectionReference.doc(id).update({
      "status1": stat2.toString(),
    });
  }

  static statusget1(String prosta) {
    if (prosta == "AVERAGE") {
      return "AVERAGE";
    } else {
      return "GOOD";
    }
  }

  static Color statcolorget1(String prores) {
    if (prores == "AVERAGE") {
      return avgClr;
    } else {
      return goodClr;
    }
  }

  //Status updated here... 3
  static updateStatus2(id, stat3) async {
    CollectionReference collectionReference = _firestore.collection("Tasks");
    collectionReference.doc(id).update({
      "status2": stat3.toString(),
    });
  }

  static statusget2(String insta) {
    if (insta == "QUOTATION") {
      return "QUOTATION";
    }
    if (insta == "SPECIFICATION") {
      return "SPECIFICATION";
    } else {
      return "FOLLOWUP";
    }
  }

  static Color statcolorget2(String inres) {
    if (inres == "QUOTATION") {
      return qtoClr;
    } else if (inres == "SPECIFICATION") {
      return spClr;
    } else {
      return flwClr;
    }
  }

  //Status updated here...5
  static updateStatus4(id, stat4) async {
    CollectionReference collectionReference = _firestore.collection("Tasks");
    collectionReference.doc(id).update({
      "status4": stat4.toString(),
    });
  }

  static statusget4(String wonsta) {
    if (wonsta == "SAMPLES") {
      return "SAMPLES";
    }
    if (wonsta == "DOCUMENTS") {
      return "DOCUMENTS";
    } else {
      return "PAYMENT";
    }
  }

  static Color statcolorget4(String wonres) {
    if (wonres == "SAMPLES") {
      return goodClr;
    } else if (wonres == "DOCUMENTS") {
      return flwClr;
    } else {
      return wonClr;
    }
  }

  //Status updated here...6
  static updateStatus5(id, stat5) async {
    CollectionReference collectionReference = _firestore.collection("Tasks");
    collectionReference.doc(id).update({
      "status5": stat5.toString(),
    });
  }

  static statusget5(String clsta) {
    if (clsta == "NO ANSWER") {
      return "NO ANSWER";
    }
    if (clsta == "INFORMATIVE") {
      return "INFORMATIVE";
    }
    if (clsta == "BUDGET ISSUE") {
      return "BUDGET ISSUE";
    } else {
      return "IRRELEVANT";
    }
  }

  static Color statcolorget5(String clres) {
    if (clres == "NO ANSWER") {
      return conClr;
    } else if (clres == "INFORMATIVE") {
      return flwClr;
    } else if (clres == "BUDGET ISSUE") {
      return clsClr;
    } else {
      return irrClr;
    }
  }
}

class FlagService {
  static Color pricolorget(String flagres) {
    if (flagres == "U") {
      return Clrs.urgent;
    } else {
      return Colors.grey;
    }
  }

  static updateFlag(id, prcl) async {
    CollectionReference collectionReference = _firestore.collection("Tasks");
    collectionReference.doc(id).update({
      "priority": prcl.toString(),
    });
  }

  static Color stateClr(String statecolor) {
    if (statecolor == "NEW") {
      return neClr;
    }
    if (statecolor == "PROSPECT") {
      return prosClr;
    }
    if (statecolor == "IN PROGRESS") {
      return ipClr;
    }
    if (statecolor == "WON") {
      return wonClr;
    } else {
      return clsClr;
    }
  }

  static Color stateClr1(String statecolor1) {
    if (statecolor1 == "NEW") {
      return neClr;
    }
    if (statecolor1 == "PROSPECT") {
      return prosClr;
    }
    if (statecolor1 == "IN PROGRESS") {
      return ipClr;
    }
    if (statecolor1 == "WON") {
      return wonClr;
    } else {
      return clsClr;
    }
  }
}

class EndDateOperations {
  static updateEdateTask(id, TextEditingController _endDateController) async {
    CollectionReference collectionReference = _firestore.collection("Tasks");
    collectionReference.doc(id).update({
      "endDate": _endDateController.text.toString(),
    });
  }

  static updateEdateTask1(id) async {
    CollectionReference collectionReference = _firestore.collection("Tasks");
    collectionReference.doc(id).update({
      "endDate": '',
    });
  }
}

class CrudOperations {
  static uploadTask(_taskController, _endDateController) async {
    CollectionReference collectionReference = _firestore.collection("Tasks");
    String did = collectionReference.doc().id;
    print(did);
    collectionReference.doc(did).set({
      "id": did,
      "task": _taskController.text.toString(),
      "startDate": Timestamp.fromDate(DateTime.now()),
      "endDate": _endDateController.text.toString(),
      "priority": "E",
      "cat": "NEW",
      "status": "FRESH",
      "status1": "AVERAGE",
      "status2": "FOLLOWUP",
      "status4": "PAYMENT",
      "status5": "IRRELEVANT",
      "Attachments": [],
      "Attachments1": [],
      "companyname": "",
      "logo": "",
      "website": "",
      "fail": 0,
      "success": 0,
      "CompanyDetails": [
        {
          "contactperson": "",
          "email": "",
          "phone": "",
        }
      ],
      "Activity": [],
      "lastseen": Timestamp.now(),
      "Certificates": [],
    }).then((value) {
      _taskController.clear();
      _endDateController.clear();
    });
  }

  static deleteTask(id) async {
    CollectionReference collectionReference = _firestore.collection("Tasks");
    collectionReference.doc(id).delete();
  }

  static certificateUpdate(id, certifi) async {
    CollectionReference collectionReference = _firestore.collection("Tasks");
    collectionReference.doc(id).update({
      "Certificates": FieldValue.arrayUnion([certifi.text.toString()])
    }).then((value) {
      certifi.clear();
    });
  }

  static deleteCertifcate(id, String element) async {
    CollectionReference collectionReference = _firestore.collection("Tasks");
    collectionReference.doc(id).update({
      "Certificates": FieldValue.arrayRemove([element])
    }).then((value) => print("Removed"));
  }
}

class StateUpdateServices {
  static prosUpdate(id, String category, note, lastDate) async {
    CollectionReference collectionReference = _firestore.collection("Tasks");
    collectionReference.doc(id).update({
      "Activity": FieldValue.arrayUnion([
        {
          "From": category,
          "To": "PROSPECT",
          "Who": "Yalagala Srinivas",
          "When": Timestamp.now(),
          "Note": note.text.toString(),
          "LatDate": lastDate,
          "Yes": ntime.compareTo(lastDate) <= 0 ? true : false
        }
      ])
    }).then((value) {
      note.clear();
    });
    print("update");
  }

  static InprosUpdate(id, String category, note, lastDate) async {
    CollectionReference collectionReference = _firestore.collection("Tasks");
    collectionReference.doc(id).update({
      "Activity": FieldValue.arrayUnion([
        {
          "From": category,
          "To": "IN PROGRESS",
          "Who": "Yalagala Srinivas",
          "When": Timestamp.now(),
          "Note": note.text.toString(),
          "LatDate": lastDate,
          "Yes": ntime.compareTo(lastDate) <= 0 ? true : false
        }
      ])
    }).then((value) {
      note.clear();
    });
    print("update");
  }

  static wonUpdate(id, String category, note, lastDate) async {
    CollectionReference collectionReference = _firestore.collection("Tasks");
    collectionReference.doc(id).update({
      "Activity": FieldValue.arrayUnion([
        {
          "From": category,
          "To": "WON",
          "Who": "Yalagala Srinivas",
          "When": Timestamp.now(),
          "Note": note.text.toString(),
          "LatDate": lastDate,
          "Yes": ntime.compareTo(lastDate) <= 0 ? true : false
        }
      ])
    }).then((value) {
      note.clear();
    });
    print("update");
  }

  static closeUpdate(id, String category, note, lastDate) async {
    CollectionReference collectionReference = _firestore.collection("Tasks");
    collectionReference.doc(id).update({
      "Activity": FieldValue.arrayUnion([
        {
          "From": category,
          "To": "CLOSE",
          "Who": "Yalagala Srinivas",
          "When": Timestamp.now(),
          "Note": note.text.toString(),
          "LatDate": lastDate,
          "Yes": ntime.compareTo(lastDate) <= 0 ? true : false
        }
      ])
    }).then((value) {
      note.clear();
    });
    print("update");
  }
}

class ComapnyUpdateServices {
  static updateCompany(id, cl1, cl2, cl3, cl4, cl5) async {
    CollectionReference collectionReference = _firestore.collection("Tasks");
    collectionReference.doc(id).update({
      "companyname": cl1.text.toString(),
      "website": cl5.text.toString(),
      "logo": "https://www.google.com/s2/favicons?sz=64&domain_url=" +
          cl5.text.toString(),
      "CompanyDetails": [
        {
          "contactperson": cl2.text.toString(),
          "email": cl3.text.toString(),
          "phone": cl4.text.toString(),
        }
      ]
    }).then((value) {
      cl1.clear();
      cl2.clear();
      cl3.clear();
      cl4.clear();
      cl5.clear();
    });
    print("update");
  }

  static addMoreContacts(id, cl2, cl3, cl4) async {
    CollectionReference collectionReference = _firestore.collection("Tasks");
    collectionReference.doc(id).update({
      "CompanyDetails": FieldValue.arrayUnion([
        {
          "contactperson": cl2.text.toString(),
          "email": cl3.text.toString(),
          "phone": cl4.text.toString(),
        }
      ])
    }).then((value) {
      cl2.clear();
      cl3.clear();
      cl4.clear();
    });
  }

  static removeContact(id, element) async {
    CollectionReference collectionReference = _firestore.collection("Tasks");
    collectionReference.doc(id).update({
      "CompanyDetails": FieldValue.arrayRemove([element])
    });
  }
}

class GraphValueServices {
  static success(id) async {
    CollectionReference collectionReference = _firestore.collection("Tasks");
    collectionReference.doc(id).update({
      "success": FieldValue.increment(1),
    });
  }

  static fail(id) async {
    CollectionReference collectionReference = _firestore.collection("Tasks");
    collectionReference.doc(id).update({
      "fail": FieldValue.increment(1),
    });
  }

  static noAnswer(id) async {
    CollectionReference collectionReference = _firestore.collection("Tasks");
    collectionReference.doc(id).update({
      "noAnswer": FieldValue.increment(1),
    });
  }

  static clientDemand(id) async {
    CollectionReference collectionReference = _firestore.collection("Tasks");
    collectionReference.doc(id).update({
      "ocd": FieldValue.increment(1),
    });
  }

  static graph(endDate, id) {
    var ntime = DateTime.now().toString().split(" ")[0];
    if (ntime.compareTo(endDate) <= 0) {
      success(id);
    } else {
      fail(id);
    }
  }
}