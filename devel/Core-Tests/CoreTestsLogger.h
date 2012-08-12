//
//
// CoreTestsLogger.h
//
//
// Copyright (c) 2008-2012 Arne Harren <ah@0xc0.de>
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

// Resets the logger.
+ (void)reset;

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


// ARC/non-ARC autorelease pool
#if __has_feature(objc_arc)
#define _lcl_logger_autoreleasepool_begin                                      \
    @autoreleasepool {
#define _lcl_logger_autoreleasepool_end                                        \
    }
#else
#define _lcl_logger_autoreleasepool_begin                                      \
    NSAutoreleasePool *_lcl_logger_autoreleasepool = [[NSAutoreleasePool alloc] init];
#define _lcl_logger_autoreleasepool_end                                        \
    [_lcl_logger_autoreleasepool release];
#endif

#ifndef _LCL_NO_IGNORE_WARNINGS
#   ifdef __clang__
    // Ignore some warnings about variadic macros when using '-Weverything'.
#   pragma clang diagnostic push
#   pragma clang diagnostic ignored "-Wunknown-pragmas"
#   pragma clang diagnostic ignored "-Wvariadic-macros"
#   pragma clang diagnostic ignored "-Wpedantic"
#   endif
#endif

// Definition of _lcl_logger.
#define _lcl_logger(log_component, log_level, log_format, ...) {               \
    _lcl_logger_autoreleasepool_begin                                          \
    [CoreTestsLogger logWithComponent:log_component                            \
                                level:log_level                                \
                               format:log_format,                              \
                                      ## __VA_ARGS__];                         \
    _lcl_logger_autoreleasepool_end                                            \
}

#ifndef _LCL_NO_IGNORE_WARNINGS
#   ifdef __clang__
#   pragma clang diagnostic pop
#   endif
#endif

