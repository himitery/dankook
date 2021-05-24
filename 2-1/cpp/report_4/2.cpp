#include <iostream>
using std::cout;
using std::endl;

template <class T> T min(T x, T y) {
    if (x > y)
        return y;
    return x;
}

int main(int argc, char *argv[]) {
    cout << "min(3, 4)" << endl;
    cout << "> " << min(3, 4) << endl;

    cout << endl;

    cout << "min('c', 'a')" << endl;
    cout << "> " << min('c', 'a') << endl;

    return 0;
}