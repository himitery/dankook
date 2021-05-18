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

    coord operator*(coord &c) { return coord(x * c.x, y * c.y); }
    coord operator/(coord &c) { return coord(x / c.x, y / c.y); }
};

int main(int argc, char **argv) {
    int x, y;

    coord c1(20, 10), c2(10, 5);

    c1.get_xy(x, y);
    cout << "c1: ("
         << "x = " << x << ", "
         << "y = " << y << ")" << endl;

    c2.get_xy(x, y);
    cout << "c2: ("
         << "x = " << x << ", "
         << "y = " << y << ")" << endl;

    cout << endl;

    coord c3 = c1 * c2;
    c3.get_xy(x, y);
    cout << "c3 = c1 * c2" << endl;
    cout << "> "
         << "c3: ("
         << "x = " << x << ", "
         << "y = " << y << ")" << endl;

    cout << endl;

    coord c4 = c1 / c2;
    c4.get_xy(x, y);
    cout << "c4 = c1 / c2" << endl;
    cout << "> "
         << "c4: ("
         << "x = " << x << ", "
         << "y = " << y << ")" << endl;

    return 0;
}