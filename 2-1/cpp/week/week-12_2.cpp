#include <iostream>
using namespace std;

template <class T> class week12 {
  private:
    int size;
    T *arr;

  public:
    week12(int n) {
        size = n;
        arr = new T(size);
    }

    void input(T *data) {
        for (int i = 0; i < size; i++)
            arr[i] = data[i];
    }

    T max() {
        T m = (T)NULL;
        for (int i = 0; i < size; i++)
            if (!m || m < arr[i])
                m = arr[i];
        return m;
    }
};

int main() {
    week12<int> w1(5);
    week12<double> w2(3);

    int data1[] = {20, 40, 15, 80, 55};
    double data2[] = {60.5, 10.8, 35.3};

    w1.input(data1);
    cout << w1.max() << endl;

    w2.input(data2);
    cout << w2.max() << endl;

    return 0;
}