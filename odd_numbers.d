// import writeln to
// write text to screen
import std.stdio: writeln; 

void oddNumbers()
{
	int sum;
	// loop from 1 to 20
	for(int number = 1; number < 21; number++)
	{
		if (number%2 != 0) {
			// its an odd number so
			// add to sum
			sum += number;
		}
	}
	//write sum of odd numbers
	writeln("Sum is ", sum);
}

void main()
{
	oddNumbers();
}