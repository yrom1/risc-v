g++ add.cpp && ./a.out
g++ -std=c++11 -S add.cpp -o 'add-atnt.s'
riscv64-unknown-elf-g++ -S add.cpp -o add-riscv.s
