#include <iostream>
#include <string>

using namespace std;
int g_num = 128;

int main (void)
{
	// 局部对象
	const string	name = "yangyang.gnu";

	// 使用局部对象
	cout << g_num << name << endl;
	return	(EXIT_SUCCESS);
}
