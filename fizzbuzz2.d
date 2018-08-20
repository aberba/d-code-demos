import std.experimental.all; 
void main() { 
    iota(1, 101)
    .map!(a => a.predSwitch!("a % b == 0") ( 
        15, "FizzBuzz", 
        5, "Buzz", 
        3, "Fizz", 
        a.to  !string, )
    ).each!writeln; 
}