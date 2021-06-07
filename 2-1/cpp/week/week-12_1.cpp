#include <cstring>
#include <iostream>
using namespace std;

class B_class {
  protected:
    char author[80];

  public:
    void put_author(const char *s) { strcpy(author, s); }
    virtual void show_author() { cout << author << endl; }
};

class D_class : public B_class {
  private:
    char title[80];

  public:
    void put_title(const char *num) { strcpy(title, num); }
    void show_author() {
        cout << author << endl;
        cout << "Title: " << title << endl;
    }
};

int main() {
    B_class *p;
    B_class B_ob;

    D_class *dp;
    D_class D_ob;

    p = &B_ob;
    p->put_author("Tom Clancy");

    p = &D_ob;
    p->put_author("William Shakespeare");
    B_ob.show_author();

    cout << endl;

    dp = &D_ob;
    dp->put_title("The Tempest");
    p->show_author();

    return 0;
}
