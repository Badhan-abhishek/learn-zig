const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    const world = "world";
    try stdout.print("Hello, {s}!\n", .{world});
    std.debug.print("Hello, second {s}!\n", .{world});
}
