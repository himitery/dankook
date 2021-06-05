#include <iostream>
using namespace std;

int main() {
    int row = 1;

    for (int i = 1000; i < 2000; i++) {
        bool is_prime = true;
        for (int j = 2; j < i / 2; j++)
            if (i % j == 0) {
                is_prime = false;
                break;
            }

        if (is_prime) {
            cout << i;
            if (row == 10) {
                cout << endl;
                row = 1;
            } else {
                cout << "\t";
                row++;
            }
        }
    }
    cout << endl;

    return 0;
}