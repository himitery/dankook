#include <iostream>
using namespace std;

int powerx(int x);
int powerx(int x, int y);
int powerx(int x, int y, int z);

int main() {
    cout << "powerx(2): " << powerx(2) << endl;
    cout << "powerx(2, 4): " << powerx(2, 4) << endl;
    cout << "powerx(2, 4, 8): " << powerx(2, 4, 8) << endl;

    return 0;
}

int powerx(int x) { return x * x; }

int powerx(int x, int y) {
    int result = 1;
    for (int i = 0; i < y; i++)
        result *= x;
    return result;
}

int powerx(int x, int y, int z) { return powerx(x, y) * z; }
