%option noyywrap
%option bison-bridge
%top {
    #define YYSTYPE char*
    }
    int num_lines = 0, num_chars = 0, len = 0, linelen = 0;

%%
\n    ++num_lines; ++num_chars; *yylval = yytext; linelen = len; len = 0; return 1;
.     ++num_chars; ++len; yymore();

%%
int main()
{
    char *line;
    while(yylex(&line) == 1) {
        fwrite( line, linelen, 1, stdout );
        putchar( '\n' );
    }
    printf( "# of lines = %d, # of chars = %d\n",
            num_lines, num_chars );
    return 0;
}
