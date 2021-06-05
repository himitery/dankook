#include <iostream>
#include <string>
using namespace std;

int find_substr(string, string);

int main() {
    string input;
    getline(cin, input);

    cout << find_substr(input, "aba") << endl;

    return 0;
}

int find_substr(string str, string pattern) {
    int count = 0;
    while (str.find(pattern) != string::npos) {
        str = str.substr(str.find(str) + 1, str.length());
        if (str.find(pattern) == 0)
            count++;
    }
    return count;
}