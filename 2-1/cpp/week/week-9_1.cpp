#include <cmath>
#include <iostream>
using namespace std;

class point {
  private:
    int x, y;

  public:
    point(int a, int b) {
        x = a;
        y = b;
    }

    float origin_distance() { return (float)sqrt(x * x + y * y); }
};

int main() {
    point p1(3, 4), p2(-1, -5);

    cout << "p1의 원점거리 = " << p1.origin_distance() << endl;
    cout << "p2의 원점거리 = " << p2.origin_distance() << endl;

    return 0;
}