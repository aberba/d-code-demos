// import write, writeln,
// readf and write text to screen
import std.stdio;

int[] reverseLinkedList(int[] list)
{
	int[] result;
	// loop in reverse order (e.i. start from last item backwards)
	for(int index = list.length - 1; index >= 0; index--)
	{
		result ~= list[index]; // add to result array
	}
	return result;
}

// Lets test reverseLinkedList() function 
// (this is not part, just testing)
void main()
{
	int[] linkedList = [1, 2, 3, 4, 5, 6];
	writeln ("Reverse is ", reverseLinkedList(linkedList));
}