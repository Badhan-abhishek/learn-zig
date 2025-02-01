const std = @import("std");
const expect = std.testing.expect;
const print = std.debug.print;

test "0-termianted sentinel array" {
    const array = [_:1]u8{ 1, 2, 3, 4 };
    // So basically above syntax add ([_:x]) x to the end of an array.
    // but length of the array remains same, which means it does not
    // actually increase the length of array but when asked for A[n],
    // it return x as if it is at n

    // this examples shows the result
    for (0..5) |value| {
        print("{}: {} \n", .{ value, array[value] });
    }

    try expect(@TypeOf(array) == [4:1]u8);
    try expect(array.len == 4);
    try expect(array[4] == 1);
}

test "extra 0s in 0-terminated sentinel array" {
    const array = [_:0]u8{ 1, 0, 0, 4 };

    for (0..5) |value| {
        print("{}: {} \n", .{ value, array[value] });
    }

    try expect(@TypeOf(array) == [4:0]u8);
    try expect(array.len == 4);
    try expect(array[4] == 0);
}
