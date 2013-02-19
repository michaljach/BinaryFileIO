//
//  BinaryFileIO.m
//  -_-
//  michal@jach.me
//
//  Created by mj on 14.02.2013. YEP, fking valentines day
//  Copyright (c) 2013 mj. All rights reserved.
//

#import "BinaryFileIO.h"

@implementation NSData(BinaryFileIO)

+ (NSData*) readBinaryFile:(NSString *)filePath atOffset:(NSString*)offset withSize:(int)size
{
    // hex NSString offset to int
    NSScanner* scannerOffset = [NSScanner scannerWithString: offset];
    unsigned int intOffset;
    [scannerOffset scanHexInt: &intOffset];
    
    // file handle with offset
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:filePath];
    [fileHandle seekToFileOffset:intOffset];
    
    // read specific bytes with size limit
    NSData *data = [fileHandle readDataOfLength:size];

    return data;
}

+ (NSData*) writeBinaryFile:(NSString*)filePath atOffset:(NSString*)offset hexData:(NSString*)data
{
    // hex NSString offset to int
    NSScanner* scannerOffset = [NSScanner scannerWithString: offset];
    unsigned int intOffset;
    [scannerOffset scanHexInt: &intOffset];
    
    // file handle with offset
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:filePath];
    [fileHandle seekToFileOffset:intOffset];
    
    // hex NSString data to NSMutableData
    data = [data stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSMutableData *newData= [[NSMutableData alloc] init];
    unsigned char whole_byte;
    char byte_chars[3] = {'\0','\0','\0'};
    int i;
    for (i=0; i < [data length]/2; i++) {
        byte_chars[0] = [data characterAtIndex:i*2];
        byte_chars[1] = [data characterAtIndex:i*2+1];
        whole_byte = strtol(byte_chars, NULL, 16);
        [newData appendBytes:&whole_byte length:1];
    }

    // write bytes to file
    [fileHandle writeData:newData];
    
    return newData;
}

@end
