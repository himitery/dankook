#include <iostream>
using namespace std;

bool isPrime(int);

int main() {
    int num = 0;

    cout << "> ";
    cin >> num;

    bool result = isPrime(num);
    if (result)
        cout << "소수입니다." << endl;
    else
        cout << "소수가 아닙니다." << endl;

    return 0;
}

bool isPrime(int num) {
    for (int i = 2; i < num; i++) {
        if (num % i == 0)
            return false;
    }
    return true;
}