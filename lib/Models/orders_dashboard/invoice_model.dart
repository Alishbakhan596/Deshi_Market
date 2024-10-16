import 'package:flutter/material.dart';

class Invoice {
  final String invoiceNo;
  final String customerName;
  final String method;
  final String amount;
  final String orderTime;
  final String status;

  Invoice({
    required this.invoiceNo,
    required this.customerName,
    required this.method,
    required this.amount,
    required this.orderTime,
    required this.status,
  });
}

List<String> tableHeaders = [
  'INVOICE NO',
  'CUSTOMER NAME',
  'METHOD',
  'AMOUNT',
  'ORDER TIME',
  'STATUS',
  'ACTIONS',
];

List<Invoice> invoiceList = [
  Invoice(
      invoiceNo: '#DSFD322',
      customerName: 'NITISH KUMAR',
      method: 'CASH',
      amount: '\$32423',
      orderTime: 'Oct 20,2024 9:31',
      status: 'Pending')
];

class InvoiceTable extends StatelessWidget {
  final List<String> headers;
  final List<Invoice> invoices;
  final Color headerColor;
  final double borderRadius;

  const InvoiceTable({
    super.key,
    required this.headers,
    required this.invoices,
    this.headerColor = const Color(0xff019934),
    this.borderRadius = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: headerColor.withOpacity(0.4),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                topRight: Radius.circular(borderRadius),
              )),
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          child: Row(
            children:
                headers.map((header) => _buildHeaderCell(header)).toList(),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: invoices.length,
            itemBuilder: (context, index) {
              final invoice = invoices[index];
              return Container(
                color: Colors.grey[200],
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  children: [
                    _buildDataCell(invoice.invoiceNo),
                    _buildDataCell(invoice.customerName),
                    _buildDataCell(invoice.method),
                    _buildDataCell(invoice.amount),
                    _buildDataCell(invoice.orderTime),
                    _buildDataCell(invoice.status),
                    _buildActionsCell(),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderCell(String text) {
    return Expanded(
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDataCell(String text) {
    return Expanded(
      child: Text(text),
    );
  }

  Widget _buildActionsCell() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.saved_search),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
