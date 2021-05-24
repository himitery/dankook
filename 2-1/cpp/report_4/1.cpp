#include <iostream>
using std::cout;
using std::endl;

class distance {
  protected:
    double diff;

  public:
    distance(double x1, double x2) { diff = x1 > x2 ? x1 - x2 : x2 - x1; }
    virtual void trav_time() { cout << diff / 60 << "h" << endl; }
};

class metric : public distance {
  public:
    metric(double x1, double x2) : distance(x1, x2) {}
    void trav_time() { cout << diff / 100 << "h" << endl; }
};

int main(int argc, char *argv[]) {
    distance d(10, 200);
    metric m(10, 200);

    cout << "distance::trav_time()" << endl;
    cout << "> ";
    d.trav_time();

    cout << endl;

    cout << "metric::trav_time()" << endl;
    cout << "> ";
    m.trav_time();

    return 0;
}