// import write, writeln,
// readf and write text to screen
import std.stdio;

void main()
{
	int[] numbers; // an arrays of intergers
	writeln("Enter numbers from 5 to 9: ");
	for (int count = 5; count < 10; count++)
	{
		write("Enter ", count, ":");
		int number;
		readf(" %s", &number); // read input into number
		numbers ~= number; // add number to numbers array
	}

	// find total
	int total;
	for(int index = 0; index < numbers.length; index++)
	{
		total += numbers[index];
	}

	// calculate average 
	double average = total / numbers.length;
	writeln ("Average is ", average);
}