const std = @import("std");

const print = std.debug.print;
const mem = std.mem;

pub fn main() void {
    const bytes = "hello";
    print("{}\n", .{@TypeOf(bytes)});
    print("{d}\n", .{bytes.len});
    print("{c}\n", .{bytes[1]});
    print("{d}\n", .{bytes[5]});
    print("{}\n", .{'e' == '\x65'});
    print("{d}\n", .{'\u{1f4a9}'});
    print("{d}\n", .{"💯"});
    print("{u}\n", .{"⚡"});
    print("{}\n", .{mem.eql(u8, "hello", "h\x65llo")});
    const invalid_utf8 = "\xff\xfe";
    print("Print invalid UTF {s}\n", .{invalid_utf8});
    print("0x{x}\n", .{invalid_utf8[1]});
}
