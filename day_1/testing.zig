const std = @import("std");

// To run this program use
// `zig test testing.zig`
test "expect addOne adds one to 41" {
    try std.testing.expect(addOne(41) == 42);
}

test "expect error" {
    try std.testing.expect(addOne(32) == 44);
}

test "Skip test" {
    return error.SkipZigTest;
}

// report memory leaks
test "detect leak" {
    var list = std.ArrayList(u21).init(std.testing.allocator);
    try list.append('☔');

    try std.testing.expect(list.items.len == 1);
}

test "builtin.is_test" {
    try std.testing.expect(isATest());
}

// Inline import works
fn isATest() bool {
    return @import("builtin").is_test;
}

fn addOne(number: i32) i32 {
    return number + 1;
}
