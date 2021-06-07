#include <iostream>
using namespace std;

class CustomException {
  private:
    string message;

  public:
    CustomException() { message = ""; }
    CustomException(string str) { message = str; }
    string get_message() { return message; }
};

double divide(double a, double b) {
    try {
        if (b == 0)
            throw CustomException("0으로 나눌 수 없습니다.");
        return a / b;
    } catch (CustomException e) {
        cout << e.get_message() << endl;
        return false;
    }
}

int main() {
    double result = 0;

    result = divide(3, 3);
    if (result)
        cout << result << endl;

    result = divide(3, 0);
    if (result)
        cout << result << endl;

    return 0;
}