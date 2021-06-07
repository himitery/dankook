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

    float two_distance(point p) { return (float)sqrt((p.x - x) * (p.x - x) + (p.y - y) * (p.y - y)); }

    friend float distance2(point a, point b);
};

float distance2(point a, point b) { return (float)sqrt((a.x - b.x) * (a.x - b.x) + (a.y - b.y) * (a.y - b.y)); }

int main() {
    point p1(3, 4), p2(-1, -5);

    cout << "p1과 p2 거리 = " << p1.two_distance(p2) << endl;
    cout << "p1과 p2 거리 = " << distance2(p1, p2) << endl;

    return 0;
}