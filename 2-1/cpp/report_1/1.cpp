#include <iostream>
#include <string>
using namespace std;

int main() {
    string str = "";
    int english = 0, number = 0, punctuation = 0;

    getline(cin, str);
    for (int i = 0; i < str.length(); i++) {
        char c = str[i];

        if (c == '.' || c == ',', c == '!')
            punctuation++;
        else if (isdigit(c))
            number++;
        else if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z'))
            english++;
    }

    cout << "영문자: \t" << english << endl;
    cout << "숫자: \t" << number << endl;
    cout << "구두점: \t" << punctuation << endl;

    return 0;
}