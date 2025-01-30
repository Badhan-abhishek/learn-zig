var outside_value: i32 = 43;

var y: i32 = add(10, x);
// x will be available anywhere because this is `const` values are `comptime`-known. This is because `const` are immutable, so these values never change.

const x: i32 = add(12, 34);

// What if a `const` value is being calculated based on value outside of zig program (user input, file etc). Will it still be `comptime`-known?
//
// const x: i32 = 30 + outside_value;
//
// as expected, in above code compiler will throw an error.

test "container level variables" {
    try expect(x == 46);
    try expect(y == 56);
}

fn add(a: i32, b: i32) i32 {
    return a + b;
}

const std = @import("std");
const expect = std.testing.expect;

test "namespaced container level variable" {
    try expect(foo() == 1235);
    try expect(foo() == 1236);
}

const S = struct {
    var x: i32 = 1234;
};

fn foo() i32 {
    S.x += 1;
    return S.x;
}

test "static local variable" {
    try expect(foo2() == 1235);
    try expect(foo2() == 1236);
}

fn foo2() i32 {
    const S2 = struct {
        var x: i32 = 1234;
    };
    S2.x += 1;
    return S2.x;
}
