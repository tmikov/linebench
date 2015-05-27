#include <iostream>

int main() {
    std::string line;
    line.reserve(1024);
    std::cin.sync_with_stdio( false );
    while (std::getline( std::cin, line )) {
        std::cout << line << std::endl;
    }
    return 0;
}
