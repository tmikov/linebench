#include <stdio.h>

int main ( void )
{
    char * line = NULL;
    size_t n = 0;
    while (getline( &line, &n, stdin ) >= 0)
        fwrite( line, n, 1, stdout );
    return 0;
}
