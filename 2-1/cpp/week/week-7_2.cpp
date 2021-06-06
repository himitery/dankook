#include <iostream>
using namespace std;

class queue {
  private:
    int *q;
    int size;
    int sloc, rloc;

  public:
    queue(int n = 100);
    ~queue();

    void qput(int i);
    int qget();

    int max();
    void reverse_print(int num);
};

queue::queue(int n) {
    sloc = rloc = -1;
    size = n;
    q = new int[size];
    cout << "Queue initalized." << endl;
}

queue::~queue() { cout << "Queue destroyed." << endl; }

void queue::qput(int i) {
    if (sloc == (size - 1)) {
        cout << "Queue is full" << endl;
        return;
    }
    q[++sloc] = i;
}

int queue::qget() {
    if (rloc == sloc) {
        cout << "Queue Underflow." << endl;
        return 0;
    }
    return q[++rloc];
}

int queue::max() {
    int max = 0;
    for (int i = rloc; i <= sloc; i++)
        if (max < q[i])
            max = q[i];
    return max;
}

void queue::reverse_print(int num) {
    for (int i = sloc; i >= sloc - 4 + 1; i--) {
        if (i < rloc)
            return;
        cout << q[i] << (i == sloc - 4 + 1 ? "\n" : ", ");
    }
}

int main() {
    queue a(20);

    cout << "qput" << endl;
    for (int i = 0; i < 6; i++) {
        int input;
        cout << "> ";
        cin >> input;
        a.qput(input);
    }

    cout << "max: " << a.max() << endl;
    cout << "reverse_print(4): ";
    a.reverse_print(4);

    return 0;
}