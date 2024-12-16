
import 'package:cuantrack_app/models/database.dart';
import 'package:cuantrack_app/models/transaction_with_category.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TransactionPage extends StatefulWidget {
  final TransactionWithCategory? transactionWithCategory;
  const TransactionPage({Key? key, required this.transactionWithCategory})
      : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  final AppDb database = AppDb();
  bool isExpense = true;
  late int type;
  List<String> list = ['Makan dan Jajan', 'Bensin', 'Event'];
  late String dropDownValue = list.first;
  TextEditingController amountControler = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController detailControler = TextEditingController();
  Category? selectedCategory;

  Future insert(int amount, DateTime date, String nameDetail, int categoryId) async {
    DateTime now = DateTime.now();
    final row = await database.into(database.transactions).insertReturning(TransactionsCompanion.insert(
      name: nameDetail, 
      category_id: categoryId, 
      transaction_date: date, 
      amount: amount, 
      createdAT: now, 
      updateAT: now));
    print('APA INI :' + row.toString());
    // ada insert ke db
  }

  Future<List<Category>> getAllCategory(int type) async {
    return await database.getAllCategoryRepo(type);
  }

  Future update(int transactionId, int amount, int categoryId, DateTime transactionDate, String nameDetail) async {
    return await database.updateTransactionRepo(
      transactionId, amount, categoryId, transactionDate, nameDetail);
  }

  @override
  void initState() {
    // TODO: implement initState
    if (widget.transactionWithCategory != null) {
      updateTransactionView(widget.transactionWithCategory!);
    } else {
      type = 2;
    }
    super.initState();
  }

  void updateTransactionView(TransactionWithCategory transactionWithCategory) {
    amountControler.text = transactionWithCategory.transaction.amount.toString();
  detailControler.text = transactionWithCategory.transaction.name;
  dateController.text = DateFormat("yyyy-MM-dd").format(transactionWithCategory.transaction.transaction_date);
  type = transactionWithCategory.category.type;
  (type == 2) ? isExpense = true : isExpense = false;
  selectedCategory = transactionWithCategory.category;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Tambah Transaksi")),
    body: SingleChildScrollView(
      child: SafeArea(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Switch(
              value: isExpense, 
              onChanged: (bool value) {
                setState(() {
                  isExpense = value;
                  type = (isExpense) ? 2 : 1;
                  selectedCategory = null;
                });
              }, 
              inactiveTrackColor:  Color.fromARGB(255, 156, 170, 218), 
              inactiveThumbColor:  Color.fromARGB(255, 121, 151, 250), 
              activeColor: Colors.red,
              ),
              Text(
                isExpense ? 'Pengeluaran' : 'Pemasukan',
                style: GoogleFonts.montserrat(fontSize: 14),
              )
          ],
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              controller: amountControler,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: UnderlineInputBorder(), labelText: "Jumlah"),
            ),
          ),
          SizedBox(height: 25,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 16),
             child: Text(
                  'Kategori',
                  style: GoogleFonts.montserrat(fontSize: 16),
                ),
           ),
           FutureBuilder<List<Category>>(
            future: getAllCategory(type),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator(),);
              } else {
                if (snapshot.hasData) {
                  if (snapshot.data!.length > 0) {
                    selectedCategory = (selectedCategory == null)
                        ? snapshot.data!.first 
                        : selectedCategory;
                    print('APANIH : ' + snapshot.toString());
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: DropdownButton<Category>(
                        value: (selectedCategory == null)
                        ? snapshot.data!.first
                        : selectedCategory,
                        isExpanded: true,
                        icon: Icon(Icons.arrow_downward),
                        items: snapshot.data!.map((Category item) {
                          return DropdownMenuItem<Category>(
                            value: item,
                            child: Text(item.name),);
                        }).toList(),
                        onChanged: (Category? value) {
                          setState(() {
                            print('SELECTED CATEGORY ' + value!.name);
                            selectedCategory = value;
                        });
                      }),
                    );
                  } else {
                    return Center(
                      child: Text("Data kosong"),
                    );
                  }
                } else {
                  return Center(
                    child: Text("Tidak ada data"),
                  );
                }
              }
            }),
          
          SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              readOnly: true,
              controller: dateController,
              decoration: InputDecoration(labelText: "Masukkan Tanggal"),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context, initialDate: DateTime.now(), 
                  firstDate: DateTime(2022), 
                  lastDate: DateTime(2099));
            
              if (pickedDate != null) {
                String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
            
                dateController.text = formattedDate;
              }
              },
            ),
          ),
          SizedBox(height: 10,),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              controller: detailControler,
              decoration: InputDecoration(
                border: UnderlineInputBorder(), labelText: "Detail"),
            ),
          ),
          SizedBox(
  height: 25,
),
Center(
  child: ElevatedButton(
    onPressed: () async {
      try {
        if (widget.transactionWithCategory == null) {
          print("Inserting data...");
          await insert(
            int.parse(amountControler.text), 
            DateTime.parse(dateController.text), 
            detailControler.text, 
            selectedCategory!.id,
          );
        } else {
          print("Updating data...");
          await update(
            widget.transactionWithCategory!.transaction.id,
            int.parse(amountControler.text),
            selectedCategory!.id,
            DateTime.parse(dateController.text), 
            detailControler.text,
          );
        }

        // Tutup layar setelah operasi selesai
        Navigator.pop(context, true);
      } catch (e) {
        print("Error during operation: $e");
      }
    },
    child: Text("Simpan"),
  ),
)

        ],
      ))),
    );  
  }
}