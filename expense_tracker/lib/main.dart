import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'ExpenseAdapter.dart';
import 'categoryAdapter.dart';

// Run this app with: flutter pub add hive hive_flutter
// Also run flutter pub add google_fonts

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Register adapters
  Hive.registerAdapter(ExpenseAdapter());
  Hive.registerAdapter(CategoryAdapter());

  // Open Hive box
  await Hive.openBox<Expense>('expensesBox');

  runApp(const ExpenseTrackerApp());
}

class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ExpenseHomePage(),
    );
  }
}

class ExpenseHomePage extends StatefulWidget {
  const ExpenseHomePage({super.key});

  @override
  State<ExpenseHomePage> createState() => _ExpenseHomePageState();
}

class _ExpenseHomePageState extends State<ExpenseHomePage> {
  late Box<Expense> expensesBox;

  List<Category> categories = const [
    Category(icon: Icons.fastfood, color: Colors.orange, name: 'Food'),
    Category(icon: Icons.movie, color: Colors.pinkAccent, name: 'Movie'),
    Category(icon: Icons.business_center, color: Colors.teal, name: 'Work'),
    Category(icon: Icons.directions_bus, color: Colors.green, name: 'Bus Fare'),
    Category(
        icon: Icons.free_breakfast, color: Colors.yellow, name: 'Breakfast'),
    Category(icon: Icons.lunch_dining, color: Colors.amber, name: 'Lunch'),
    Category(
        icon: Icons.dinner_dining, color: Colors.deepOrange, name: 'Dinner'),
    Category(
        icon: Icons.menu_book, color: Colors.purple, name: 'Study Materials'),
    Category(icon: Icons.train, color: Colors.blue, name: 'Train Fare'),
    Category(icon: Icons.cookie, color: Colors.brown, name: 'Snacks'),
    Category(
        icon: Icons.local_drink, color: Colors.lightBlue, name: 'Water Bottle'),
    Category(
        icon: Icons.phone_android, color: Colors.grey, name: 'Mobile Recharge'),
    Category(icon: Icons.coffee, color: Colors.deepPurple, name: 'Coffee'),
    Category(icon: Icons.book, color: Colors.lime, name: 'Books'),
    Category(icon: Icons.category, color: Colors.blueGrey, name: 'Other'),
  ];

  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  DateTime? _selectedDate;
  Category? _selectedCategory;

  @override
  void initState() {
    super.initState();
    expensesBox = Hive.box<Expense>('expensesBox');
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 5),
      lastDate: now,
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _showAddExpenseSheet() {
    _titleController.clear();
    _priceController.clear();
    _selectedDate = null;
    _selectedCategory = null;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Add New Expense',
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _priceController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(labelText: 'Price'),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No date chosen!'
                          : 'Date: ${_selectedDate!.month}/${_selectedDate!.day}/${_selectedDate!.year}',
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                  ),
                  TextButton(
                    onPressed: _pickDate,
                    child: const Text('Choose Date'),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                children: categories
                    .map(
                      (cat) => ChoiceChip(
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(cat.icon, color: cat.color, size: 18),
                            const SizedBox(width: 4),
                            Text(cat.name,
                                style: GoogleFonts.poppins(fontSize: 12)),
                          ],
                        ),
                        selectedColor: cat.color.withOpacity(0.3),
                        selected: _selectedCategory == cat,
                        onSelected: (selected) {
                          setState(() {
                            _selectedCategory = selected ? cat : null;
                          });
                        },
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final enteredTitle = _titleController.text.trim();
                  final enteredPrice = double.tryParse(_priceController.text);
                  if (enteredTitle.isEmpty ||
                      enteredPrice == null ||
                      _selectedDate == null ||
                      _selectedCategory == null) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            'Please fill all fields and select a category')));
                    return;
                  }

                  final newExpense = Expense(
                    title: enteredTitle,
                    price: enteredPrice,
                    date: _selectedDate!,
                    iconCodePoint: _selectedCategory!.icon.codePoint,
                    iconFontFamily: _selectedCategory!.icon.fontFamily ?? '',
                    iconFontPackage: _selectedCategory!.icon.fontPackage,
                    colorValue: _selectedCategory!.color.value,
                  );

                  expensesBox.add(newExpense);
                  setState(() {});
                  Navigator.of(context).pop();
                },
                child: const Text('Add Expense'),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  void _deleteExpense(int index) {
    expensesBox.deleteAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final expenses = expensesBox.values.toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFBA00E5), Color(0xFF00B2FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ExpenseTracker',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: _showAddExpenseSheet,
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.add, color: Colors.deepPurple),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories
                      .map((cat) => Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child:
                                CategoryIcon(icon: cat.icon, color: cat.color),
                          ))
                      .toList(),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: expenses.isEmpty
                  ? Center(
                      child: Text(
                        'No expenses added yet!',
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: expenses.length,
                      itemBuilder: (context, index) {
                        final exp = expenses[index];
                        return Dismissible(
                          key: ValueKey(exp.key),
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20),
                            child:
                                const Icon(Icons.delete, color: Colors.white),
                          ),
                          direction: DismissDirection.endToStart,
                          onDismissed: (_) => _deleteExpense(index),
                          child: ExpenseCard(
                            title: exp.title,
                            price: '\$${exp.price.toStringAsFixed(2)}',
                            date:
                                '${exp.date.month}/${exp.date.day}/${exp.date.year}',
                            color: Color(exp.colorValue),
                            icon: IconData(
                              exp.iconCodePoint,
                              fontFamily: exp.iconFontFamily,
                              fontPackage: exp.iconFontPackage,
                            ),
                            highlight: false,
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 50),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddExpenseSheet,
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Expense extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  double price;

  @HiveField(2)
  DateTime date;

  // IconData properties since IconData isn't Hive supported
  @HiveField(3)
  int iconCodePoint;

  @HiveField(4)
  String iconFontFamily;

  @HiveField(5)
  String? iconFontPackage;

  @HiveField(6)
  int colorValue;

  Expense({
    required this.title,
    required this.price,
    required this.date,
    required this.iconCodePoint,
    required this.iconFontFamily,
    required this.iconFontPackage,
    required this.colorValue,
  });
}

class Category {
  final IconData icon;
  final Color color;
  final String name;

  const Category({
    required this.icon,
    required this.color,
    required this.name,
  });
}

class CategoryIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const CategoryIcon({super.key, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 28,
      backgroundColor: color.withOpacity(0.2),
      child: Icon(icon, color: color, size: 28),
    );
  }
}

class ExpenseCard extends StatelessWidget {
  final String title;
  final String price;
  final String date;
  final IconData icon;
  final Color color;
  final bool highlight;

  const ExpenseCard({
    super.key,
    required this.title,
    required this.price,
    required this.date,
    required this.icon,
    required this.color,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        border:
            highlight ? Border.all(color: Colors.orangeAccent, width: 2) : null,
        boxShadow: [
          if (highlight)
            BoxShadow(
              color: Colors.orange.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),
              Text(
                date,
                style: GoogleFonts.poppins(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
          Row(
            children: [
              Icon(icon, size: 24, color: Colors.white70),
              const SizedBox(width: 12),
              Text(
                price,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
