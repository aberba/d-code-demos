import std.stdio;
void main()
{
	float[100] numbers;
	float sum = 0.0, average;

	write("Enter the number of inputs: ");
	int numberOfInputs;
	readf(" %s", &numberOfInputs);

	while (numberOfInputs > 100 ||
		   numberOfInputs <= 0)
	{
		//continue until a valid input is given
		writeln("Number must be between 10 to 100");
		write("Please enter again: ");
		readf(" %s", &numberOfInputs);
	}

    // 0..numberOfInputs means from 0 to value of numberOfInputs
	foreach (i; 0..numberOfInputs) {
		write("Enter value ", i + 1, " :");
		readf(" %s", &numbers[i]);
		writeln ("value is ", numbers[i]);
		sum += numbers[i];
	}
	average = sum / numberOfInputs;
	writeln("Average is: ", average, " for ", sum / numberOfInputs);
}