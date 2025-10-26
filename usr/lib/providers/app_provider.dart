import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Task {
  final String title;
  final double reward;
  bool isCompleted;

  Task({required this.title, required this.reward, this.isCompleted = false});

  Map<String, dynamic> toJson() => {
    'title': title,
    'reward': reward,
    'isCompleted': isCompleted,
  };

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    title: json['title'],
    reward: json['reward'],
    isCompleted: json['isCompleted'],
  );
}

class Transaction {
  final String description;
  final double amount;
  final DateTime date;

  Transaction({required this.description, required this.amount, required this.date});

  Map<String, dynamic> toJson() => {
    'description': description,
    'amount': amount,
    'date': date.toISOString(),
  };

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    description: json['description'],
    amount: json['amount'],
    date: DateTime.parse(json['date']),
  );
}

class AppProvider extends ChangeNotifier {
  final SharedPreferences prefs;

  AppProvider(this.prefs) {
    _loadData();
  }

  double _balance = 0.0;
  List<Task> _tasks = [
    Task(title: 'Watch a 30-second ad', reward: 0.00001),
    Task(title: 'Complete daily login', reward: 0.000005),
    Task(title: 'Share app on social media', reward: 0.00002),
    Task(title: 'Rate the app', reward: 0.000015),
    Task(title: 'Invite 1 friend', reward: 0.0001),
  ];
  List<Transaction> _transactions = [];
  String _referralCode = '';

  double get balance => _balance;
  List<Task> get tasks => _tasks;
  List<Transaction> get transactions => _transactions;
  String get referralCode => _referralCode;

  void _loadData() {
    _balance = prefs.getDouble('balance') ?? 0.0;
    _referralCode = prefs.getString('referralCode') ?? _generateReferralCode();
    // Load tasks and transactions if needed
    notifyListeners();
  }

  void _saveData() {
    prefs.setDouble('balance', _balance);
    prefs.setString('referralCode', _referralCode);
  }

  String _generateReferralCode() {
    return 'REF${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}';
  }

  void completeTask(int index) {
    if (index < _tasks.length && !_tasks[index].isCompleted) {
      _tasks[index].isCompleted = true;
      _balance += _tasks[index].reward;
      _transactions.add(Transaction(
        description: 'Completed: ${_tasks[index].title}',
        amount: _tasks[index].reward,
        date: DateTime.now(),
      ));
      _saveData();
      notifyListeners();
    }
  }

  void addReferralEarning() {
    const double referralReward = 0.0001;
    _balance += referralReward;
    _transactions.add(Transaction(
      description: 'Referral bonus',
      amount: referralReward,
      date: DateTime.now(),
    ));
    _saveData();
    notifyListeners();
  }
}