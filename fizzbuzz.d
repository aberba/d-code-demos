import std.stdio : writeln;
import std.algorithm : map;
import std.range : iota;
import std.conv : to;

void main()
{
    writeln(iota(1, 101).map!(number => number % 3 == 0 && number % 5 == 0
            ? "FizzBuzz" 
            : number % 3 == 0 
                ? "Fizz" 
                : number % 5 == 0 
                    ? "Buzz" 
                    : to!string(number)
                )
            );
}
