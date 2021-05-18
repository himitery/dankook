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

    friend coord operator-(coord c1, coord c2);
    friend coord operator/(coord c1, coord c2);
};

coord operator-(coord c1, coord c2) {
    return (coord(c1.x - c2.x, c1.y - c2.y));
}

coord operator/(coord c1, coord c2) {
    return (coord(c1.x / c2.x, c1.y / c2.y));
}

int main(int argc, char *argv[]) {
    int x, y;

    coord c1(20, 30), c2(5, 10);
    coord c3 = c1 - c2, c4 = c1 / c2;

    c1.get_xy(x, y);
    cout << "c1: ("
         << "x = " << x << ", "
         << "y = " << y << ")" << endl;

    c2.get_xy(x, y);
    cout << "c2: ("
         << "x = " << x << ", "
         << "y = " << y << ")" << endl;

    cout << endl;

    cout << "c3 = c1 - c2" << endl;
    c3.get_xy(x, y);
    cout << "> "
         << "c3: ("
         << "x = " << x << ", "
         << "y = " << y << ")" << endl;

    cout << endl;

    cout << "c4 = c1 / c2" << endl;
    c4.get_xy(x, y);
    cout << "> "
         << "c4: ("
         << "x = " << x << ", "
         << "y = " << y << ")" << endl;

    return 0;
}
