int global_variable;

int
lib_function1(int a)
{
	return (a + global_variable);
}

int
lib_function2(int a)
{
	return (lib_function1(a));
}
