#!/usr/bin/env python

for i in xrange(0,688128):
    print """int main ( void )
{
    char buf[4096];
    while (gets(buf))
        puts(buf);
    return 0;
}"""
