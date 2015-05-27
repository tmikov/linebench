#include <stdio.h>

int main ( void )
{
    char buf[4096];
    while (gets(buf))
        puts(buf);
    return 0;
}
