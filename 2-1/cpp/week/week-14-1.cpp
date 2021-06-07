#include <iostream>
using namespace std;

class box {
  private:
    double i, w, h;

  public:
    box() {}
    box(double a, double b, double c) : i(a), w(b), h(c) {}
    void vol() { cout << "부피: " << i * w * h << endl; }
    friend box add_box(box a, box b);
    box operator*(box op2) {
        i *= op2.i;
        w *= op2.w;
        h *= op2.h;

        return *this;
    }
};

box add_box(box a, box b) {
    box temp;

    temp.i = a.i + b.i;
    temp.w = a.w + b.w;
    temp.h = a.h + b.h;

    return temp;
}

int main() {
    box x(3.0, 2.0, 1.0), y(1.0, 2.0, 3.0), z;
    z = add_box(x, y);
    z.vol();
    z = x * y;
    z.vol();

    return 0;
}