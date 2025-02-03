const expect = @import("std").testing.expect;
const print = @import("std").debug.print;

test "pointer arithmetic with many-item pointer" {
    const array = [_]i32{ 1, 2, 3, 4 };
    var ptr: [*]const i32 = &array;

    try expect(ptr[0] == 1);
    ptr += 1;
    try expect(ptr[0] == 2);

    // Slicing a many-item pointer without an end is equivalent to
    // pointer arithmetc: `ptr[start..] == ptr + start`
    try expect(ptr[1..] == ptr + 1);
}

test "pointer arithmetic with slices" {
    var array = [_]i32{ 1, 2, 3, 4 };
    var length: usize = 0;
    _ = &length; // Suppress unused
    var slice = array[length..array.len];

    print("SLICE IS: {d}\n", .{slice});

    try expect(slice[0] == 1);
    try expect(slice.len == 4);

    slice.ptr += 1;

    try expect(slice[0] == 2);
    try expect(slice.len == 4);
}

// Since slices have bound checking, they are protected against undefined behaviour
// Pointers work at compile-time too, as long as the code does not depend on an undefined memory layout
