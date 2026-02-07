#include <iostream>
using namespace std;

int main() {
    char X;
    cin >> X; 
    if (X >= 'a' && X <= 'z') {
        cout << char(X - 32) << endl;

    } else {
        cout << char(X + 32) << endl;
    }
    return 0;
}
