#include <iostream>
#include <math.h>
using namespace std;

int main() {
    cout.setf(ios::left);
    cout.setf(ios::showpos);
    cout.setf(ios::fixed);

    for (int i = 2; i <= 20; i++) {
        cout.precision(5);
        cout.width(10);
        cout << log(i) << log10(i) << endl;
    }

    return 0;
}