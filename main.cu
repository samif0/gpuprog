#include <iostream>
#include <stdlib.h>
#include <cstdio>

__global__ void whoami(void) {
    int block_id = 
        blockIdx.x +
        blockIdx.y * gridDim.x +
        blockIdx.x * gridDim.x * gridDim.y;

    int block_offset = 
        block_id * 
        blockDim.x * blockDim.y * blockDim.z;

    int thread_offset =
        threadIdx.x +
        threadIdx.y * blockDim.x +
        threadIdx.z * blockDim.x * blockDim.y;

    int id = block_offset + thread_offset;

    printf("%04d\n", id); 
}

int main(int argc, char const *argv[])
{  
    const int b_x = 2, b_y = 3, b_z = 4;
    const int t_x = 4, t_y = 4, t_z = 4;
    
    int blocks_per_grid = b_x * b_y * b_z;
    int threads_per_block = t_x * t_y * t_z;

    std::cout << "bl/g: " << blocks_per_grid << std::endl;
    std::cout << "th/g: " << threads_per_block << std::endl;
    std::cout << "total threads: " << blocks_per_grid * threads_per_block << std::endl;


    dim3 cuBPG(b_x, b_y, b_z);
    dim3 cuTPB(t_x, t_y, t_z);


    whoami<<<cuBPG, cuTPB>>>();
    cudaDeviceSynchronize();

    return EXIT_SUCCESS;
}
