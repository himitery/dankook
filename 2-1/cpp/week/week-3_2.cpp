#include <iostream>
using namespace std;

int main() {
    string line = "";
    int space = 0, comma = 0, close = 0;

    do {
        getline(cin, line);

        for (int i = 0; i < line.length(); i++)
            switch (line[i]) {
            case ' ':
            case '\t':
            case '\n':
                space++;
                break;
            case ',':
                comma++;
            case '.':
                close++;
            }
    } while (line.length() != 0);

    cout << "공백:\t" << space << endl;
    cout << "콤마:\t" << comma << endl;
    cout << "마침표:\t" << close << endl;

    return 0;
}