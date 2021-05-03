#include <cstring>
#include <iostream>
using namespace std;

/* 첫 번째 인자의 배열에 두 번째 인자의 문자열을 추가하는 함수 */
bool append_string(char[], string, int);

int main(void) {
    char bigstr[100];
    const int max_size = sizeof bigstr;

    /* bigstr 메모리 공간은 \0으로 초기화 */
    memset(bigstr, '\0', max_size);

    while (true) {
        string str;
        getline(cin, str);

        if (str == "quit" || !append_string(bigstr, str, max_size))
            break;
    }
    cout << bigstr << endl;
    return 0;
}

bool append_string(char arr[], string str, int max_size) {
    const int length_of_array = strlen(arr);

    if (length_of_array + str.length() >= max_size)
        return false;
    for (register int i = 0; i < str.length(); i++)
        arr[length_of_array + i] = str.at(i);

    /*
        문자열의 마지막은 '\0' 값을 가져야하여
        문자열의 길이를 최대 (max_size - 1)로 제한
    */
    strlen(arr) < max_size - 1 ? arr[strlen(arr)] = '\n' : NULL;
    return strlen(arr) < max_size - 1;
}
