//
//  BinaryFileIO.h
//  -_-
//  michal@jach.me
//
//  Created by mj on 14.02.2013. YEP, fking valentines day
//  Copyright (c) 2013 mj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData(BinaryFileIO)
+ (NSData*) readBinaryFile:(NSString *)filePath atOffset:(NSString*)offset withSize:(int)size;
+ (NSData*) writeBinaryFile:(NSString *)filePath atOffset:(NSString*)offset hexData:(NSString*)data;
@end
