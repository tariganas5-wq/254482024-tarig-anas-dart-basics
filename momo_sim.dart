// Student: Tarig Anas
// Reg no: 254482024
const String regNo = '254482024';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// F1: Format money
String formatRwf(int amount) {
// by TA
bool negative = amount < 0;
String digits = amount.abs().toString();
String result = '';
int i = 0;

while (i < digits.length) {
result += digits[digits.length - 1 - i];

if ((i + 1) % 3 == 0 && i + 1 < digits.length) {
  result += ',';
}

i++;
}

String reversed = '';
int j = result.length - 1;

while (j >= 0) {
reversed += result[j];
j--;
}

if (negative) {
reversed = '-$reversed';
}

return '$reversed RWF';
}

// F2: Validate PIN
bool isValidPin(String pin) {
  // by TA
  if (pin.length != 5 || pin == '12345') {
    return false;
  }

  int i = 0;

  while (i < pin.length) {
    if (int.tryParse(pin[i]) == null) {
      return false;
    }
    i++;
  }

  int same = 1;
  int j = 1;

  while (j < pin.length) {
    if (pin[j] != pin[0]) {
      same = 0;
    }
    j++;
  }

  if (same == 1) {
    return false;
  }

  return true;
}

// MoMo fee
int momoFee(int amount) {
// by TA
if (amount <= 0) {
return -1;
} else if (amount <= 1000) {
return 20;
} else if (amount <= 10000) {
return 100;
} else if (amount <= 150000) {
return 250;
} else {
return 1500;
}
}

// F3: Send money
int sendMoney(int balance, int amount) {
// by TA
int fee = momoFee(amount);

if (fee == -1) {
print('Failed: invalid amount');
return balance;
}

if (amount + fee > balance) {
print('Failed: insufficient balance');
return balance;
}

int newBalance = balance - amount - fee;

print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). New balance: ${formatRwf(newBalance)}');

return newBalance;
}

// F4: Buy airtime
int buyAirtime(int balance, int amount) {
// by TA
if (amount < 100 || amount > 50000) {
print('Failed: invalid airtime amount');
return balance;
}

if (amount > balance) {
print('Failed: insufficient balance');
return balance;
}

int newBalance = balance - amount;

print('Airtime purchased: ${formatRwf(amount)}. New balance: ${formatRwf(newBalance)}');

return newBalance;
}

// Main function
void main() {
// by TA
print('Reg no: $regNo | D = $d | T = $t');

// PIN tests
print(isValidPin('12345'));
print(isValidPin('77777'));
print(isValidPin('4821'));
print(isValidPin('48a21'));
print(isValidPin('48214'));

// Starting balance
int balance = 20000 + t * 500;

print('Starting balance: ${formatRwf(balance)}');
// Send money three times
int amount = (d + 1) * 3000;

balance = sendMoney(balance, amount);
balance = sendMoney(balance, amount);
balance = sendMoney(balance, amount);

// Buy airtime
balance = buyAirtime(balance, 1000);

// Invalid transactions
balance = sendMoney(balance, 0);
balance = sendMoney(balance, 200000);

print('Final balance: ${formatRwf(balance)}');

// Additional tests
print(formatRwf(0));        // Expected: 0 RWF
print(formatRwf(999));      // Expected: 999 RWF
print(formatRwf(1000));     // Expected: 1,000 RWF
print(formatRwf(-5000));    // Expected: -5,000 RWF
print(formatRwf(1234567));  // Expected: 1,234,567 RWF
print(isValidPin('12345')); // Expected: false
print(isValidPin('48219')); // Expected: true
}