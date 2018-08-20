import std.stdio, std.algorithm;
void main()
{
	int[char] counts;
	File("file.txt").byLine.each!( (x) => x.each!( i => counts[i] += 1));
	writeln(counts);
}