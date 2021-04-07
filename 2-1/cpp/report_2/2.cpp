#include <cstring>
#include <iostream>
#define DEFAULT_ARRAY_SIZE 80
using namespace std;

int get_array_size(char *arr);
void rev_str(char *);
void rev_str(char *, char *);

int main(int argc, char **argv) {
    char str[DEFAULT_ARRAY_SIZE];
    char s1[DEFAULT_ARRAY_SIZE], s2[DEFAULT_ARRAY_SIZE];

    if (argc >= 2)
        strcpy(str, argv[1]);
    else
        cin >> str;

    cout << "string: " << str << endl << endl;

    cout << "set: s1 = " << str << endl;
    strcpy(s1, str);
    cout << "rev_str(s1)" << endl;
    rev_str(s1);
    cout << "> s1: " << s1 << endl;

    cout << endl;

    cout << "set: s1 = " << str << endl;
    strcpy(s1, str);
    cout << "rev_str(s1, s2)" << endl;
    rev_str(s1, s2);
    cout << "> s1: " << s1 << endl;
    cout << "> s2: " << s2 << endl;

    return 0;
}

int get_array_size(char *arr) {
    int size = 0;

    for (register int i = 0; i < DEFAULT_ARRAY_SIZE; i++)
        if (arr[i] != '\0')
            size += 1;
        else
            break;

    return size;
}

void rev_str(char *arr) {
    int size = get_array_size(arr);

    for (register int i = 0; i < size / 2; i++) {
        char temp = arr[size - i - 1];
        arr[size - i - 1] = arr[i];
        arr[i] = temp;
    }
}

void rev_str(char *arr_1, char *arr_2) {
    int size = get_array_size(arr_1);

    for (register int i = 0; i < size; i++) {
        arr_2[i] = arr_1[size - i - 1];
    }
    arr_2[size] = '\0';
}
