void main()
{
	import std.stdio: writeln;
	import std.file: readText;
	import std.array: array, join;
	import std.algorithm: splitter, reverse;

	writeln( readText("file.txt").splitter(' ').array .reverse.join(" ") );
}
