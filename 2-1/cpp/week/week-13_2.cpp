#include <iostream>
#include <math.h>
using namespace std;

int main() {
    cout.setf(ios::showpos);

    for (int i = 2; i <= 20; i++) {
        cout.precision(5);
        cout.width(10);
        cout << left << log(i) << log10(i) << endl;
    }

    return 0;
}