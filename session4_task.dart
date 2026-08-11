

import 'dart:io';

void main() {
  // Task 1: Student Grades
 
  print('--- Task 1: Student Grades ---');
  Map<String, int> students = {
    'Ahmed': 85,
    'Sara': 92,
    'Omar': 78,
    'Mona': 65,
    'Ali': 88
  };
  int totalGrades = 0;

  print('1. All students and their grades:');
  for (var entry in students.entries) {
    print('${entry.key}: ${entry.value}');
    totalGrades += entry.value;
  }

  print('\n2. Students who scored 80 or higher:');
  for (var entry in students.entries) {
    if (entry.value >= 80) {
      print('${entry.key} (${entry.value})');
    }
  }
  double average = totalGrades / students.length;
  print('\n3. Average grade: $average\n');


  // Task 2: Remove Duplicates
  print('--- Task 2: Remove Duplicates ---');
  List<int> numbers = [1, 2, 3, 2, 4, 5, 1, 3, 6, 4];
  
  Set<int> uniqueSet = numbers.toSet();
  print('1 & 2. Unique numbers (using Set): $uniqueSet');
  print('3. Number of unique numbers: ${uniqueSet.length}');

  List<int> uniqueList = [];
  for (int number in numbers) {
    if (!uniqueList.contains(number)) {
      uniqueList.add(number);
    }
  }
  print('Bonus - Unique numbers (without toSet): $uniqueList\n');


  // Task 3: Shopping Cart
  print('--- Task 3: Shopping Cart ---');
  Map<String, double> cart = {
    'Laptop': 950.0,
    'Mouse': 25.0,
    'Keyboard': 60.0,
    'Monitor': 150.0,
    'USB Cable': 10.0
  };

  double totalPrice = 0;
  String mostExpensive = '';
  double highestPrice = 0;

  print('1. Every product and its price:');
  for (var entry in cart.entries) {
    print('${entry.key}: \$${entry.value}');
    totalPrice += entry.value;

    if (entry.value > highestPrice) {
      highestPrice = entry.value;
      mostExpensive = entry.key;
    }
  }
  print('\n2. Total price: \$${totalPrice}');
  
  print('\n3. Products that cost more than 50:');
  for (var entry in cart.entries) {
    if (entry.value > 50) print('${entry.key}: \$${entry.value}');
  }
  print('\n4. Most expensive product: $mostExpensive (\$${highestPrice})\n');


  // Task 4: Number Guessing Game
  print('--- Task 4: Number Guessing Game ---');
  int secretNumber = 73; // الرقم السري
  int attempts = 0;
  bool isCorrect = false;

  print('Welcome to the Number Guessing Game!');
  while (!isCorrect) {
    stdout.write('Enter your guess: ');
    String? input = stdin.readLineSync();
    
    if (input != null && int.tryParse(input) != null) {
      int guess = int.parse(input);
      attempts++;

      if (guess > secretNumber) {
        print('Too high!');
      } else if (guess < secretNumber) {
        print('Too low!');
      } else {
        print('Correct!');
        print('You found the number in $attempts attempts.\n');
        isCorrect = true;
      }
    } else {
      print('Please enter a valid number.');
    }
  }


  // Task 5: Unique Words
  print('--- Task 5: Unique Words ---');
  String sentence = "dart is fun and dart is powerful";
  List<String> words = sentence.split(' ');

  Set<String> uniqueWords = {};
  for (String word in words) {
    uniqueWords.add(word);
  }
  print('1. All unique words: $uniqueWords');
  print('2. Number of unique words: ${uniqueWords.length}');

  Map<String, int> wordCount = {};
  for (String word in words) {
    if (wordCount.containsKey(word)) {
      wordCount[word] = wordCount[word]! + 1;
    } else {
      wordCount[word] = 1;
    }
  }
  print('3. Word occurrences: $wordCount\n');


  // Task 6: Simple ATM
  print('--- Task 6: Simple ATM ---');
  double balance = 1000.0; 
  bool isRunning = true;

  do {
    print('\nATM Menu:');
    print('1. Check Balance');
    print('2. Deposit');
    print('3. Withdraw');
    print('4. Exit');
    stdout.write('Choose an option: ');
    
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print('Your current balance is: \$${balance}');
        break;
      case '2':
        stdout.write('Enter amount to deposit: ');
        String? depInput = stdin.readLineSync();
        if (depInput != null && double.tryParse(depInput) != null) {
          double amount = double.parse(depInput);
          balance += amount;
          print('Deposit successful.');
        } else {
          print('Invalid amount.');
        }
        break;
      case '3':
        stdout.write('Enter amount to withdraw: ');
        String? withInput = stdin.readLineSync();
        if (withInput != null && double.tryParse(withInput) != null) {
          double amount = double.parse(withInput);
          if (amount <= balance) {
            balance -= amount;
            print('Withdrawal successful.');
          } else {
            print('Insufficient funds!');
          }
        } else {
          print('Invalid amount.');
        }
        break;
      case '4':
        print('Exiting ATM...');
        isRunning = false;
        break;
      default:
        print('Invalid option');
    }
  } while (isRunning);
}