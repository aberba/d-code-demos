int[] evenNumbers(int[] numbers) 
{
    import std.algorithm: filter;
    import std.array: array;
    return numbers.filter!(number => number % 2 == 0).array;
}

unittest
{
    assert(evenNumbers([1, 2, 3, 4, 5, 6, 7, 8]), [2, 4, 6, 8]);
}

void main()
{
    import std.stdio: writeln;
    writeln(evenNumbers([1, 2, 3, 4, 5, 6, 7, 8]));
}