#include <iostream>
using namespace std;

int main() {
    string line;
    int token = 0;

    while (true) {
        getline(cin, line);
        if (line.length() == 0)
            break;
        line.append(" ");

        while (line.length() != 0) {
            string sub = line.substr(line.find(' ') + 1, line.length());
            if (sub[0] != ' ') {
                line = sub;
                token++;
            }
        }
    }
    cout << "총 토큰의 수: " << token << endl;

    return 0;
}