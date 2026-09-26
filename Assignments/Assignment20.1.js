// ==========================================
// DAY 20 - JAVASCRIPT LOOPS ASSIGNMENTS
// ==========================================


// 1. Series: 1 to 20
console.log("\n1. Series 1 to 20");

console.log("FOR LOOP:");
for (let i = 1; i <= 20; i++) {
    console.log(i);
}

console.log("WHILE LOOP:");
let i = 1;
while (i <= 20) {
    console.log(i);
    i++;
}

console.log("DO WHILE LOOP:");
i = 1;
do {
    console.log(i);
    i++;
} while (i <= 20);


// ==========================================
// 2. Odd numbers: 1 to 20
// ==========================================
console.log("\n2. Odd Numbers");

console.log("FOR LOOP:");
for (let i = 1; i <= 20; i += 2) {
    console.log(i);
}

console.log("WHILE LOOP:");
i = 1;
while (i <= 20) {
    console.log(i);
    i += 2;
}

console.log("DO WHILE LOOP:");
i = 1;
do {
    console.log(i);
    i += 2;
} while (i <= 20);


// ==========================================
// 3. Even numbers: 0 to 20
// ==========================================
console.log("\n3. Even Numbers");

console.log("FOR LOOP:");
for (let i = 0; i <= 20; i += 2) {
    console.log(i);
}

console.log("WHILE LOOP:");
i = 0;
while (i <= 20) {
    console.log(i);
    i += 2;
}

console.log("DO WHILE LOOP:");
i = 0;
do {
    console.log(i);
    i += 2;
} while (i <= 20);


// ==========================================
// 4. 5 Series: 0 5 10 15 20 25
// ==========================================
console.log("\n4. 5 Series");

console.log("FOR LOOP:");
for (let i = 0; i <= 25; i += 5) {
    console.log(i);
}

console.log("WHILE LOOP:");
i = 0;
while (i <= 25) {
    console.log(i);
    i += 5;
}

console.log("DO WHILE LOOP:");
i = 0;
do {
    console.log(i);
    i += 5;
} while (i <= 25);


// ==========================================
// 5. Sum: 1 + 2 + 3 + ... + 20
// ==========================================
console.log("\n5. Sum of 1 to 20");

console.log("FOR LOOP:");
let sum = 0;
for (let i = 1; i <= 20; i++) {
    sum = sum + i;
}
console.log("Sum =", sum);

console.log("WHILE LOOP:");
i = 1;
sum = 0;
while (i <= 20) {
    sum = sum + i;
    i++;
}
console.log("Sum =", sum);

console.log("DO WHILE LOOP:");
i = 1;
sum = 0;
do {
    sum = sum + i;
    i++;
} while (i <= 20);
console.log("Sum =", sum);


// ==========================================
// 6. Sum: 0 + 2 + 4 + ... + 20
// ==========================================
console.log("\n6. Sum of Even Numbers");

console.log("FOR LOOP:");
sum = 0;
for (let i = 0; i <= 20; i += 2) {
    sum = sum + i;
}
console.log("Sum =", sum);

console.log("WHILE LOOP:");
i = 0;
sum = 0;
while (i <= 20) {
    sum = sum + i;
    i += 2;
}
console.log("Sum =", sum);

console.log("DO WHILE LOOP:");
i = 0;
sum = 0;
do {
    sum = sum + i;
    i += 2;
} while (i <= 20);
console.log("Sum =", sum);


// ==========================================
// 7. Sum: 1 + 3 + 5 + ... + 19
// ==========================================
console.log("\n7. Sum of Odd Numbers");

console.log("FOR LOOP:");
sum = 0;
for (let i = 1; i <= 20; i += 2) {
    sum = sum + i;
}
console.log("Sum =", sum);

console.log("WHILE LOOP:");
i = 1;
sum = 0;
while (i <= 20) {
    sum = sum + i;
    i += 2;
}
console.log("Sum =", sum);

console.log("DO WHILE LOOP:");
i = 1;
sum = 0;
do {
    sum = sum + i;
    i += 2;
} while (i <= 20);
console.log("Sum =", sum);


// ==========================================
// 8. Sum: 0 + 5 + 10 + 15 + 20 + 25
// ==========================================
console.log("\n8. Sum of 5 Series");

console.log("FOR LOOP:");
sum = 0;
for (let i = 0; i <= 25; i += 5) {
    sum = sum + i;
}
console.log("Sum =", sum);

console.log("WHILE LOOP:");
i = 0;
sum = 0;
while (i <= 25) {
    sum = sum + i;
    i += 5;
}
console.log("Sum =", sum);

console.log("DO WHILE LOOP:");
i = 0;
sum = 0;
do {
    sum = sum + i;
    i += 5;
} while (i <= 25);
console.log("Sum =", sum);


// ==========================================
// 9. 1/1! + 2/2! + 3/3! + ... + 10/10!
// ==========================================
console.log("\n9. Factorial Series");

console.log("FOR LOOP:");
sum = 0;
let fact = 1;

for (let i = 1; i <= 10; i++) {
    fact = fact * i;
    sum = sum + (i / fact);
}
console.log("Sum =", sum);

console.log("WHILE LOOP:");
i = 1;
sum = 0;
fact = 1;

while (i <= 10) {
    fact = fact * i;
    sum = sum + (i / fact);
    i++;
}
console.log("Sum =", sum);

console.log("DO WHILE LOOP:");
i = 1;
sum = 0;
fact = 1;

do {
    fact = fact * i;
    sum = sum + (i / fact);
    i++;
} while (i <= 10);

console.log("Sum =", sum);


// ==========================================
// 10. 0 + 2/2! + 4/4! + 6/6! + ... + 10/10!
// ==========================================
console.log("\n10. Even Factorial Series");

console.log("FOR LOOP:");
sum = 0;

for (let i = 0; i <= 10; i += 2) {

    fact = 1;

    for (let j = 1; j <= i; j++) {
        fact = fact * j;
    }

    if (i != 0) {
        sum = sum + (i / fact);
    }
}

console.log("Sum =", sum);


console.log("WHILE LOOP:");
i = 0;
sum = 0;

while (i <= 10) {

    fact = 1;
    let j = 1;

    while (j <= i) {
        fact = fact * j;
        j++;
    }

    if (i != 0) {
        sum = sum + (i / fact);
    }

    i += 2;
}

console.log("Sum =", sum);


console.log("DO WHILE LOOP:");
i = 0;
sum = 0;

do {

    fact = 1;
    let j = 1;

    while (j <= i) {
        fact = fact * j;
        j++;
    }

    if (i != 0) {
        sum = sum + (i / fact);
    }

    i += 2;

} while (i <= 10);

console.log("Sum =", sum);


// ==========================================
// 11. 1/1! + 3/3! + 5/5! + ... + 9/9!
// ==========================================
console.log("\n11. Odd Factorial Series");

console.log("FOR LOOP:");
sum = 0;

for (let i = 1; i <= 9; i += 2) {

    fact = 1;

    for (let j = 1; j <= i; j++) {
        fact = fact * j;
    }

    sum = sum + (i / fact);
}

console.log("Sum =", sum);


console.log("WHILE LOOP:");
i = 1;
sum = 0;

while (i <= 9) {

    fact = 1;
    let j = 1;

    while (j <= i) {
        fact = fact * j;
        j++;
    }

    sum = sum + (i / fact);
    i += 2;
}

console.log("Sum =", sum);


console.log("DO WHILE LOOP:");
i = 1;
sum = 0;

do {

    fact = 1;
    let j = 1;

    while (j <= i) {
        fact = fact * j;
        j++;
    }

    sum = sum + (i / fact);
    i += 2;

} while (i <= 9);

console.log("Sum =", sum);


// ==========================================
// END
// ==========================================
console.log("\n========== ALL 11 PROGRAMS COMPLETED ==========");