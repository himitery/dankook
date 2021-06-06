#include <iostream>
using namespace std;

class box {
  private:
    double x, y, z;
    double volume;

  public:
    void setbox(double a, double b, double c) {
        x = a;
        y = b;
        z = c;
    }

    void calcvolume() { volume = x * y * z; }

    int vol() { return volume; }
};

int main() {
    box mybox;
    int a, b, c;

    cin >> a >> b >> c;

    mybox.setbox(a, b, c);
    mybox.calcvolume();

    cout << "부피: " << mybox.vol() << endl;

    return 0;
}