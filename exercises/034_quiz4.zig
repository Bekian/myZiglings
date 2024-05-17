//
// Quiz time. See if you can make this program work!
//
// Solve this any way you like, just be sure the output is:
//
//     my_num=42
//
const std = @import("std");

const NumError = error{IllegalNumber};
// i left my original solution here so i can see how i solved it originally
// the correct solution is in comments and the patch
pub fn main() void { // should be !void
    const stdout = std.io.getStdOut().writer();

    const my_num = getNumber() catch 42;
    // should be:
    // const my_num = try getNumber() 42;

    // the below line is unnecessary
    errdefer std.debug.print("my_num=42", .{});
    stdout.print("my_num={}\n", .{my_num}) catch std.debug.print("my_num=42", .{});
    // should be:
    // try stdout.print("my_num={}\n", .{my_num})
}

// This function is obviously weird and non-functional. But you will not be changing it for this quiz.
fn getNumber() NumError!u32 {
    // this expression is weird
    // my guess is that the expression is false, and therefore is true, thus resulting in the error,
    // idk why true isnt used for clarity
    if (false) return NumError.IllegalNumber;
    return 42;
}
