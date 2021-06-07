#include <iostream>
using namespace std;

class rectangle {
  private:
    int x1, y1;
    int x2, y2;

  public:
    rectangle(int a1, int b1, int a2, int b2) {
        x1 = a1;
        y1 = b1;
        x2 = a2;
        y2 = b2;
    }

    int area();
    int largearea(rectangle rect);
};

int rectangle::area() {
    int area = (x2 - x1) * (y2 - y1);
    if (area > 0)
        return area;
    return -area;
}

int rectangle::largearea(rectangle rect) {
    if (area() > rect.area())
        return area();
    return rect.area();
}

int main() {
    rectangle r1(1, 1, 3, 4), r2(-1, -2, 1, -5);

    cout << "사각형 1의 면적 = " << r1.area() << endl;
    cout << "더 큰 사각형의 면적 = " << r1.largearea(r2) << endl;

    return 0;
}