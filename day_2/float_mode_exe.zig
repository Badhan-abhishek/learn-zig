const print = @import("std").debug.print;

extern fn foo_strict(x: f64) f64;
extern fn foo_optimized(x: f64) f64;

pub fn main() void {
    const x = 0.001;
    print("Optimized = {}\n", .{foo_optimized(x)});
    print("strict = {}\n", .{foo_strict(x)});
}

// Make sure float_mode_obj.zig is built before running this, check file for command
//
// Build command for this file
//
// zig build-exe float_mode_exe.zig float_mode_obj.o
//
// RUN
//
// ./float_mode_exe
