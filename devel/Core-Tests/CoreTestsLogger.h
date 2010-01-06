//
//
// CoreTestsLogger.h
//
//
// Copyright (c) 2008-2009 Arne Harren <ah@0xc0.de>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <Foundation/Foundation.h>


//
// Core-Tests Logger class
//

@interface CoreTestsLogger : NSObject {
    
}

// Returns an auto-released copy of the last log entry if it exists,
// returns @"NO LOG ENTRY" otherwise.
+ (NSString *)lastLogEntry;

// Logs the given message.
+ (void)logWithComponent:(_lcl_component_t)component level:(_lcl_level_t)level
                  format:(NSString *)format, ... __attribute__((format(__NSString__, 3, 4)));

@end


//
// Integration with LibComponentLogging Core
//


// Definition of _lcl_logger.
#define _lcl_logger(log_component, log_level, log_format, ...) {               \
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];                \
    [CoreTestsLogger logWithComponent:log_component                            \
                                level:log_level                                \
                               format:log_format,                              \
                                      ## __VA_ARGS__];                         \
    [pool release];                                                            \
}

