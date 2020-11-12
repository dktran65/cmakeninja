#include <iostream>

void array_boundary_defect();

int main(int argc, char *argv[])
{
	std::cout << "Hello CMake!" << std::endl;
	array_boundary_defect();
	
	return 0;
}

void array_boundary_defect() 
{
	char a[5] ={0,1,2,3,4};

	a[5] = 5;
}
