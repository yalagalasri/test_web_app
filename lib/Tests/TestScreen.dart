// import 'dart:io';
// import 'dart:typed_data';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
// import 'package:syncfusion_flutter_pdf/pdf.dart';
// import 'Models/UserModels.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'dart:async';
//
// class CheckScreen extends StatefulWidget {
//   const CheckScreen({Key? key}) : super(key: key);
//
//   @override
//   _CheckScreenState createState() => _CheckScreenState();
// }
//
// class _CheckScreenState extends State<CheckScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("GeneratePdf"),
//       ),
//       body: Center(
//         child: FlatButton(
//           onPressed: () {
//             generatePdf();
//           },
//           child: Text("GeneratePdf"),
//         ),
//       ),
//     );
//   }
//
//   Future<void> generatePdf() async {
//     final PdfDocument document = PdfDocument();
//     final PdfPage page = document.pages.add();
//
//     final Size pageSize = page.getClientSize();
//
//     //final PdfGrid grid = getGrid();
//     //final PdfLayoutResult result = drawHeader(page, pageSize, grid);
//     // drawGrid(page, grid, result);
//     // drawFooter(page, pageSize);
//     final bytes = document.save();
//     document.dispose();
//     Uint8List fileBytes = Uint8List.fromList(bytes);
//     FirebaseStorage storage = FirebaseStorage.instance;
//     TaskSnapshot upload =
//         await storage.ref('Attachments/yalagala').putData(fileBytes);
//     String myUrl = await upload.ref.getDownloadURL();
//   }
//
//   PdfGrid getGrid() {
//     //Create a PDF grid
//     final PdfGrid grid = PdfGrid();
//     //Secify the columns count to the grid.
//     grid.columns.add(count: 5);
//     //Create the header row of the grid.
//     final PdfGridRow headerRow = grid.headers.add(1)[0];
//     //Set style
//     headerRow.style.backgroundBrush = PdfSolidBrush(PdfColor(68, 114, 196));
//     headerRow.style.textBrush = PdfBrushes.white;
//     headerRow.cells[0].value = 'Product Id';
//     headerRow.cells[0].stringFormat.alignment = PdfTextAlignment.center;
//     headerRow.cells[1].value = 'Product Name';
//     headerRow.cells[2].value = 'Price';
//     headerRow.cells[3].value = 'Quantity';
//     headerRow.cells[4].value = 'Total';
//     //Add rows
//     addProducts('CA-1098', 'AWC Logo Cap', 8.99, 2, 17.98, grid);
//     addProducts('LJ-0192', 'Long-Sleeve Logo Jersey,M', 49.99, 3, 149.97, grid);
//     addProducts('So-B909-M', 'Mountain Bike Socks,M', 9.5, 2, 19, grid);
//     addProducts('LJ-0192', 'Long-Sleeve Logo Jersey,M', 49.99, 4, 199.96, grid);
//     addProducts('FK-5136', 'ML Fork', 175.49, 6, 1052.94, grid);
//     addProducts('HL-U509', 'Sports-100 Helmet,Black', 34.99, 1, 34.99, grid);
//     //Apply the table built-in style
//     grid.applyBuiltInStyle(PdfGridBuiltInStyle.listTable4Accent5);
//     //Set gird columns width
//     grid.columns[1].width = 200;
//     for (int i = 0; i < headerRow.cells.count; i++) {
//       headerRow.cells[i].style.cellPadding =
//           PdfPaddings(bottom: 5, left: 5, right: 5, top: 5);
//     }
//     for (int i = 0; i < grid.rows.count; i++) {
//       final PdfGridRow row = grid.rows[i];
//       for (int j = 0; j < row.cells.count; j++) {
//         final PdfGridCell cell = row.cells[j];
//         if (j == 0) {
//           cell.stringFormat.alignment = PdfTextAlignment.center;
//         }
//         cell.style.cellPadding =
//             PdfPaddings(bottom: 5, left: 5, right: 5, top: 5);
//       }
//     }
//     return grid;
//   }
//
//   PdfLayoutResult drawHeader(PdfPage page, Size pageSize, PdfGrid grid) {
//     //Draw rectangle
//     page.graphics
//         .drawRectangle(bounds: Rect.fromLTWH(0, 0, pageSize.width - 100, 100));
//     final PdfFont contentFont = PdfStandardFont(PdfFontFamily.helvetica, 9);
//
//     //Draw string
//     page.graphics.drawString(
//         "JR Compliance and Testing Labs\nRegd. Office: 705, 7th Floor,Krishna Apra Tower,Netaji\nSubhash Place,Pitampura,New Delhi 110034,India\nPAN: AALFJ0070E\nTAN: DELJ10631F\nGST REGN NO: 07AALFJ0070E1ZO",
//         PdfStandardFont(PdfFontFamily.helvetica, 10),
//         bounds: Rect.fromLTWH(100, 10, 400, 200),
//         format: PdfStringFormat(alignment: PdfTextAlignment.right));
//     page.graphics.drawLine(
//         PdfPen(
//           PdfColor(142, 170, 219, 255),
//         ),
//         Offset(0, pageSize.height - 100),
//         Offset(pageSize.width, pageSize.height - 100));
//     page.graphics.drawString('', contentFont,
//         brush: PdfBrushes.white,
//         bounds: Rect.fromLTWH(400, 0, pageSize.width - 400, 33),
//         format: PdfStringFormat(
//             alignment: PdfTextAlignment.center,
//             lineAlignment: PdfVerticalAlignment.bottom));
//     //Create data foramt and convert it to text.
//     final DateFormat format = DateFormat.yMMMMd('en_US');
//     final String invoiceNumber =
//         'Invoice Number: 2058557939\r\n\r\nDate: ${format.format(DateTime.now())}';
//     final Size contentSize = contentFont.measureString(invoiceNumber);
//     // ignore: leading_newlines_in_multiline_strings
//     String addresss = '''To: \r\n\n$tradename,
//         \n$address,
//         \n$pincode.''';
//
//     PdfTextElement(text: invoiceNumber, font: contentFont).draw(
//         page: page,
//         bounds: Rect.fromLTWH(pageSize.width - (contentSize.width + 30), 120,
//             contentSize.width + 30, pageSize.height - 120));
//
//     return PdfTextElement(text: addresss, font: contentFont).draw(
//         page: page,
//         bounds: Rect.fromLTWH(30, 120,
//             pageSize.width - (contentSize.width + 30), pageSize.height - 120))!;
//   }
//
//   void drawGrid(PdfPage page, PdfGrid grid, PdfLayoutResult result) {
//     Rect? totalPriceCellBounds;
//     Rect? quantityCellBounds;
//     //Invoke the beginCellLayout event.
//     grid.beginCellLayout = (Object sender, PdfGridBeginCellLayoutArgs args) {
//       final PdfGrid grid = sender as PdfGrid;
//       if (args.cellIndex == grid.columns.count - 1) {
//         totalPriceCellBounds = args.bounds;
//       } else if (args.cellIndex == grid.columns.count - 2) {
//         quantityCellBounds = args.bounds;
//       }
//     };
//     //Draw the PDF grid and get the result.
//     result = grid.draw(
//         page: page, bounds: Rect.fromLTWH(0, result.bounds.bottom + 40, 0, 0))!;
//
//     //Draw grand total.
//     page.graphics.drawString('Grand Total',
//         PdfStandardFont(PdfFontFamily.helvetica, 9, style: PdfFontStyle.bold),
//         bounds: Rect.fromLTWH(
//             quantityCellBounds!.left,
//             result.bounds.bottom + 10,
//             quantityCellBounds!.width,
//             quantityCellBounds!.height));
//     page.graphics.drawString(getTotalAmount(grid).toString(),
//         PdfStandardFont(PdfFontFamily.helvetica, 9, style: PdfFontStyle.bold),
//         bounds: Rect.fromLTWH(
//             totalPriceCellBounds!.left,
//             result.bounds.bottom + 10,
//             totalPriceCellBounds!.width,
//             totalPriceCellBounds!.height));
//   }
//
//   //Draw the invoice footer data.
//   void drawFooter(PdfPage page, Size pageSize) {
//     final PdfPen linePen =
//         PdfPen(PdfColor(142, 170, 219, 255), dashStyle: PdfDashStyle.custom);
//     linePen.dashPattern = <double>[3, 3];
//     //Draw line
//     page.graphics.drawLine(linePen, Offset(0, pageSize.height - 100),
//         Offset(pageSize.width, pageSize.height - 100));
//
//     const String footerContent =
//         // ignore: leading_newlines_in_multiline_strings
//         '''800 Interchange Blvd.\r\n\r\nSuite 2501, Austin,
//          TX 78721\r\n\r\nAny Questions? support@adventure-works.com''';
//
//     //Added 30 as a margin for the layout
//     page.graphics.drawString(
//         footerContent, PdfStandardFont(PdfFontFamily.helvetica, 9),
//         format: PdfStringFormat(alignment: PdfTextAlignment.right),
//         bounds: Rect.fromLTWH(pageSize.width - 30, pageSize.height - 70, 0, 0));
//   }
//
//   //Create PDF grid and return
//
//   //Create and row for the grid.
//   void addProducts(String productId, String productName, double price,
//       int quantity, double total, PdfGrid grid) {
//     final PdfGridRow row = grid.rows.add();
//     row.cells[0].value = productId;
//     row.cells[1].value = productName;
//     row.cells[2].value = price.toString();
//     row.cells[3].value = quantity.toString();
//     row.cells[4].value = total.toString();
//   }
//
//   //Get the total amount.
//   double getTotalAmount(PdfGrid grid) {
//     double total = 0;
//     for (int i = 0; i < grid.rows.count; i++) {
//       final String value =
//           grid.rows[i].cells[grid.columns.count - 1].value as String;
//       total += double.parse(value);
//     }
//     return total;
//   }
//
//   _readImageData(String name) async {
//     final data = await rootBundle.load('Logos/$name');
//     return data.offsetInBytes;
//     //return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
//   }
// }
