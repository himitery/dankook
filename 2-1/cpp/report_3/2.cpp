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

    bool operator==(coord &c) { return (x == c.x && y == c.y); }
    coord operator&&(coord &c) { return coord(x && c.x, y && c.y); }
};

int main(int argc, char *argv[]) {
    int x, y;

    coord c1(10, 20), c2(10, 20), c3(5, 0);

    c1.get_xy(x, y);
    cout << "c1: ("
         << "x = " << x << ", "
         << "y = " << y << ")" << endl;

    c2.get_xy(x, y);
    cout << "c2: ("
         << "x = " << x << ", "
         << "y = " << y << ")" << endl;

    c3.get_xy(x, y);
    cout << "c3: ("
         << "x = " << x << ", "
         << "y = " << y << ")" << endl;

    cout << endl;

    cout << "c1 == c2" << endl;
    cout << "> " << (c1 == c2) << endl;

    cout << endl;

    cout << "c1 == c3" << endl;
    cout << "> " << (c1 == c3) << endl;

    cout << endl;

    coord c4 = c1 && c2;
    c4.get_xy(x, y);
    cout << "c4 = c1 && c2" << endl;
    cout << "> "
         << "c4: ("
         << "x = " << x << ", "
         << "y = " << y << ")" << endl;

    cout << endl;

    coord c5 = c1 && c3;
    c5.get_xy(x, y);
    cout << "c5 = c1 && c3" << endl;
    cout << "> "
         << "c5: ("
         << "x = " << x << ", "
         << "y = " << y << ")" << endl;

    return 0;
}
