import std.stdio : write, writeln, readf;
import std.algorithm : reverse, reduce, max, min, sum, find;
import std.range : empty;

int[] getNumbers()
{
	import std.stdio : readf, write;

	int[5] numbers;
	int inputNumber;
	foreach (count; 0 .. 5)
	{
		write("Enter a number for array element ", count, ": ");
		readf(" %s", inputNumber);
		numbers[count] = inputNumber;
	}
	return numbers.dup;
}

void main()
{
	auto numbers = getNumbers();

	// Reverse 
	auto reserveInputs = numbers.dup;
	reserveInputs.reverse();
	writeln("reverse is ", reserveInputs);

	// maximum, minimum, avearge
	writeln("maximum is ", numbers.reduce!max);
	writeln("minimum is ", numbers.reduce!min);
	writeln("average is ", numbers.sum() / numbers.length);

	//find input from array
	int inputNumber;
	write("Enter a number to find in array: ");
	readf(" %s", inputNumber);
	writeln("Found? ", numbers.find(inputNumber).empty() ? "No" : "Yes");
}
