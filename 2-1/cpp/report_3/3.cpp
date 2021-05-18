#include <iostream>
using namespace std;

class coord {
  private:
    int x, y;

  public:
    coord() {
        x = 0;
        y = 0;
    }

    coord(int i, int j) {
        x = i;
        y = j;
    }

    void get_xy(int &i, int &j) {
        i = x;
        j = y;
    }

    coord operator--() {
        x--;
        y--;
        return *this;
    }

    coord operator--(int) {
        coord temp = *this;
        x--;
        y--;
        return temp;
    }
};

int main(int argc, char *argv[]) {
    int x, y;

    coord c1(10, 20);

    c1.get_xy(x, y);
    cout << "c1: ("
         << "x = " << x << ", "
         << "y = " << y << ")" << endl;

    cout << endl;

    cout << "c1--" << endl;
    (c1--).get_xy(x, y);
    cout << "> "
         << "c1: ("
         << "x = " << x << ", "
         << "y = " << y << ")" << endl;
    c1.get_xy(x, y);
    cout << "> "
         << "c1: ("
         << "x = " << x << ", "
         << "y = " << y << ")" << endl;

    cout << endl;

    cout << "--c1" << endl;
    (--c1).get_xy(x, y);
    cout << "> "
         << "c1: ("
         << "x = " << x << ", "
         << "y = " << y << ")" << endl;
    c1.get_xy(x, y);
    cout << "> "
         << "c1: ("
         << "x = " << x << ", "
         << "y = " << y << ")" << endl;

    return 0;
}