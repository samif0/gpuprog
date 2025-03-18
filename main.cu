#include <iostream>
#include <stdlib.h>

int main(int argc, char const *argv[])
{  
    const int b_x = 2, b_y = 3, b_z = 4;
    const int t_x = 4, t_y = 4, t_z = 4;
    
    int blocks_per_grid = b_x * b_y * b_z;
    int threads_per_block = t_x * t_y * t_z;

    std::cout << "bl/g: " << blocks_per_grid << std::endl;
    std::cout << "th/g: " << threads_per_block << std::endl;
    std::cout << "total threads: " << blocks_per_grid * threads_per_block << std::endl;
    return EXIT_SUCCESS;
}
