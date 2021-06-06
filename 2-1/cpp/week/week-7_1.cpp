#include <iostream>
using namespace std;

class mystring {
  private:
    char str[80];

  public:
    mystring(char *s) {
        int index = 0;
        while (s[index] != '\0' && index < 80)
            str[index] = s[index++];
    }

    int strlength() {
        int index = 0;
        while (str[index++] != '\0') {
        }
        return index;
    }

    int numchar(char ch) {
        int count = 0, index = 0;
        while (str[index] != '\0')
            if (str[index++] == ch)
                count++;
        return count;
    }
};

int main() {
    mystring my("i am studing C++ language.");

    cout << "문자열 길이: " << my.strlength() << endl;
    cout << "문자 a의 개수: " << my.numchar('a') << endl;

    return 0;
}