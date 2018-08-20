#!/usr/bin/env rdmd

import std.conv;
import std.stdio;
import std.array;
import std.range;
import std.datetime;
import std.algorithm;


void main() {
    int[] a = [1, 2, 3, 4, 5, 6, 7, 4].cycle.take(2000).array;
    int[] b = [3, 4, 6].cycle.take(2000).array;

    void originalMethod()
    {   auto c = a.remove!(x => b.canFind(x));
        assert(c[0 .. 4] == [1, 2, 5, 7]);
    }

    void WilsonMethod()
    {   auto c = a.filter!(x => !b.canFind(x)).array;
        assert(c[0 .. 4] == [1, 2, 5, 7]);
    }

    void myMethod()
    {   auto sortedB = sort(b.dup);
        auto c = a
        .   filter!(i => !sortedB.contains(i))
        .   array
        ;
        assert(c[0 .. 4] == [1, 2, 5, 7]);
    }

    void partitionMethod() {
        auto c = a.partition!(v => b.canFind(v));
        // Sort to recover the order
        assert(sort(c[0..4]).array == [1, 2, 5, 7]);
    }

    void stablePartitionMethod() {
        auto c = a.partition!(v => b.canFind(v), SwapStrategy.stable);
        assert(c[0..4] == [1, 2, 5, 7]);
    }

    void newPartitionMethod()
    {   auto sortedB = sort(b.dup).uniq.array;
        auto c = a.partition!(v => sortedB.assumeSorted.contains(v));
        assert(c[0 .. 4] == [1, 2, 5, 7], c[0..4].to!string);
    }

    void newStablePartitionMethod()
    {   auto sortedB = sort(b.dup).uniq.array;
        auto c = a.partition!(v => sortedB.assumeSorted.contains(v),
                              SwapStrategy.stable);
        assert(c[0 .. 4] == [1, 2, 5, 7], c[0..4].to!string);
    }

    benchmark!(originalMethod,
               WilsonMethod,
               myMethod,
               partitionMethod,
               stablePartitionMethod,
               newPartitionMethod,
               newStablePartitionMethod)(1)
        .each!writeln;
}

/* Results (one of many runs, considered characteristic):
 *     TickDuration(18129442) // originalMethod
 *     TickDuration(28536187) // WilsonMethod
 *     TickDuration(845396)   // myMethod
 *     TickDuration(29936970) // partitionMethod
 *     TickDuration(33447345) // stablePartitionMethod
 *     TickDuration(548226)   // newPartitionMethod
 *     TickDuration(597183)   // newStablePartitionMethod
 */



/***************************************************************************
* ReoveAll 
************************************************************************/
import std.container.array;
alias ArrI = Array!int;

auto removeAll(ArrI a, ArrI b) {
    import std.array;
    import std.range;
    import std.algorithm;

    auto sortedB = sort(b[]).uniq.array;
    auto c = a[].partition!(v => sortedB.assumeSorted.contains(v),
                          SwapStrategy.stable);
    return ArrI(c);
}

void main() {
    import std.stdio;

    auto a = ArrI(1, 2, 3, 4, 5, 6, 7, 4);
    auto b = ArrI(3, 4, 6);

    a.removeAll(b)[].writeln;
}

// Note especially how you slice an Array to access its data.