const @"identifier with spaces in it" = 0xff;
const @"1SmallStep4Man" = 112358;

const print = @import("std").debug.print;
const c = @import("std").c;

pub extern "c" fn @"error"() void;
pub extern "c" fn @"fstat$INODE64"(fd: c.fd_t, buf: *c.Stat) c_int;

const Color = enum {
    red,
    @"really red",
};
const color: Color = .@"really red";

pub fn main() void {
    print("{}\n", .{color});
    print("{}\n", .{@"identifier with spaces in it"});
    print("{}\n", .{@"1SmallStep4Man"});
}
