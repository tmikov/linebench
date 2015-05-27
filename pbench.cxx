#include <iostream>
#include <locale>
#include <string>

int main()
{
    std::ios_base::sync_with_stdio(false);
    std::cin.sync_with_stdio(false);
    std::cout.sync_with_stdio(false);

    std::cin.imbue(std::locale::classic());
    std::cout.imbue(std::locale::classic());

    std::cin.tie(0);

    std::cin.exceptions(std::ios_base::goodbit);
    std::cout.exceptions(std::ios_base::goodbit);

    char buf[0x1000];
    while (std::cin) {
        std::cin.getline(buf, sizeof(buf));
        buf[std::cin.gcount()] = '\n';
        std::cout.write(buf, std::cin.gcount() + 1);
    }
}
