class FileDemo {
	string fileName;
	this(string name)
	{
		this.fileName = name;
	}

	size_t totalLines()
	{
		File file = File(fileName, "r");
		scope(exit) file.close();
		size_t total;
		foreach(line; file.byLine)
			if (line != "") total += 1;
		return total;
	}

	size_t totalWords()
	{
		File file = File(fileName, "r");
		scope(exit) file.close();
		size_t total;
		foreach(line; file.byLine)
		{
			if (line != "") {
				import std.algorithm, std.array;
				total += line.splitter(' ').array.length;
			}
		}
		return total;
	}

	size_t totalCharacters()
	{
		File file = File(fileName, "r");
		scope(exit) file.close();

		size_t total;
		foreach(line; file.byLine)
		{
			if (line != "") {
				foreach(character; line) {
					if (character != ' ') total += 1;
				}
			}
		}
		return total;
	}
}

import std.stdio;
void main() {
	auto demo = new FileDemo("file.txt");
	writeln(demo.totalLines(), " line(s)");
	writeln(demo.totalWords(), " word(s)");
	writeln(demo.totalCharacters(), " character(s)");
}