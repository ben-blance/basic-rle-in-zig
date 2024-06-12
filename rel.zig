const std = @import("std");

//function to count shit
fn countIndividualChars(s: []const u8) void {
    var charCounts = [_]u32{0} ** 256; // Only ascciii plz :D

    var updatedString = std.ArrayList(u8).init(std.heap.page_allocator);

    // go through the loop
    for (s) |char| {
        charCounts[char] += 1;
    }

    // print count of char
    var i: u32 = 0;
    while (i < 256) {
        const count = charCounts[i];
        if (count > 0) {
            std.debug.print("Character '{}': {}\n", .{ i, count });
        }
        i += 1;
    }

    //build the updated string

    var currentChar: u8 = undefined;
    var currentCount: u32 = 0;

    for (s) |char| {
        if (char == currentChar) {
            currentCount += 1;
        } else {
            if (currentCount > 0) {
                updatedString.append(currentChar) catch unreachable;
                if (currentCount > 1) {
                    const countStr = std.fmt.allocPrint(std.heap.page_allocator, "{}", .{currentCount}) catch unreachable;
                    for (countStr) |c| {
                        updatedString.append(c) catch unreachable;
                    }
                    std.heap.page_allocator.free(countStr);
                }
            }
            currentChar = char;
            currentCount = 1;
        }
    }

    if (currentCount > 0) {
        updatedString.append(currentChar) catch unreachable;
        if (currentCount > 1) {
            const countStr = std.fmt.allocPrint(std.heap.page_allocator, "{}", .{currentCount}) catch unreachable;
            for (countStr) |c| {
                updatedString.append(c) catch unreachable;
            }
            std.heap.page_allocator.free(countStr);
        }
    }

    // the updated string should be if input AAAA then A4
    std.debug.print("Updated string: {s}\n", .{updatedString.items});
}

pub fn main() !void {
    const stdin = std.io.getStdIn();
    const reader = stdin.reader();

    var rle_buffer: [1024]u8 = undefined;
    std.debug.print("Enter Your Text to compress DOGG: ", .{});

    const rle_result = try reader.readUntilDelimiterOrEof(&rle_buffer, '\n');

    if (rle_result) |value| {
        countIndividualChars(value);
    } else {
        std.debug.print("Something went wrong", .{});
    }

    //countIndividualChars("ssAAAAhhiillliisGOATT");

    const args = try std.process.argsAlloc(std.heap.page_allocator);
    // I love Differ lol
    defer std.process.argsFree(std.heap.page_allocator, args);

    // Check if the correct number of arguments is provided
    if (args.len != 2) {
        // if something goes wrong
        std.debug.print("Usage: {s} <string>\n", .{args[0]});
        return;
    }

    const inputString = args[1];

    countIndividualChars(inputString);
}
