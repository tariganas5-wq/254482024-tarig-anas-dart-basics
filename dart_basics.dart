// Student: Tarig Anas
// Reg no: 254482024
const String regNo = '254482024';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// B2: Count vowels
int countVowels(String text) {
// by TA
int count = 0;
String lowerText = text.toLowerCase();

int i = 0;
while (i < lowerText.length) {
if ('aeiou'.contains(lowerText[i])) {
count++;
}
i++;
}

return count;
}

// B3: Get initials
String initials(String fullName) {
// by TA
String cleaned = fullName.trim();

if (cleaned.isEmpty) {
return '';
}

List<String> names = cleaned.split(RegExp(r'\s+'));
String result = '';

int i = 0;
while (i < names.length) {
result += '${names[i][0].toUpperCase()}.';
i++;
}

return result;
}

// C5: Draw triangle
void drawTriangle(int height) {
// by TA
int row = 1;

while (row <= height) {
String line = '';
int spaces = 0;

while (spaces < height - row) {
  line += ' ';
  spaces++;
}

int col = 0;
String symbol = row.isEven ? '#' : '*';

while (col < row) {
  line += symbol;
  col++;
}

print(line);
row++;
}
}

// D2: Calculate MoMo fee
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

// D2: Mask phone number
String maskPhone(String phone) {
  // by TA
  if (phone.length != 10) {
    return 'INVALID';
  }

  String stars = '';
  int i = 0;

  while (i < phone.length - 5) {
    stars += '*';
    i++;
  }

  return phone.substring(0, 3) +
      stars +
      phone.substring(phone.length - 2);
}

// Main function
void main() {
// by TA
print('Reg no: $regNo | D = $d | T = $t');

// B2
print('Tarig Anas has ${countVowels('Tarig Anas')} vowels');

// B3
print(initials('Tarig Anas'));
print(initials(' ana uwase '));
print(initials(' '));

// C5
drawTriangle(d + 3);
drawTriangle(0);
drawTriangle(-2);

// D2
int i = 1;
int totalFees = 0;
String phone = '0788123456';

while (i <= d + 3) {
int amount = i * 4000 + t * 100;
int fee = momoFee(amount);

totalFees += fee;

print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');

i++;
}

print('Total fees: $totalFees RWF');
}