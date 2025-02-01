const std = @import("std");
const expectEqual = std.testing.expectEqual;

// Vector usually run paralle, using SIMD instructions if possible.
// If ops on vectors are shorter then SIMD size (native) then it
// will compile to single SIMD instructions
// for longer, multiple SIMD instructions
// Apple Silicon M1 supports 128 bit SIMD instructions
// but no SVE SIMD

test "Basic vector usage" {
    // Vectors have a compile-time known length and base type
    // this means no var vectors? will find out

    const a = @Vector(4, i32){ 1, 2, 3, 4 };
    const b = @Vector(4, i32){ 5, 6, 7, 8 };

    // Math operations take place element-wise

    const c = a + b;

    // Use array indexing for accessing individual vector
    try expectEqual(6, c[0]);
    try expectEqual(8, c[1]);
    try expectEqual(10, c[2]);
    try expectEqual(12, c[3]);
}

test "Conversion between vectors, arrays, and slices" {
    const arr1: [4]f32 = [_]f32{ 1.1, 3.2, 4.5, 5.6 };
    const vec: @Vector(4, f32) = arr1;
    const arr2: [4]f32 = vec;
    try expectEqual(arr1, arr2);

    // You can also assign from a slice with comptime-known length to
    // vector using .*
    const vec2: @Vector(2, f32) = arr1[1..3].*;

    const slice: []const f32 = &arr1;

    var offset: u32 = 1;
    _ = &offset; // Suppress var is never mutated error (nice trick)
    // We are basically starting from index 1 in slice  below
    // this is for extracting a comptime-known length from a runtime
    // known offset.
    const vec3: @Vector(2, f32) = slice[offset..][0..2].*;
    try expectEqual(slice[offset], vec2[0]);
    try expectEqual(slice[offset + 1], vec2[1]);
    try expectEqual(vec2, vec3);
}
