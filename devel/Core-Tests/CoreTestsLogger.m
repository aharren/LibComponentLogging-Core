//
//
// CoreTestsLogger.m
//
//
// Copyright (c) 2008-2013 Arne Harren <ah@0xc0.de>
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

#import "lcl.h"
#import "CoreTestsLogger.h"


static NSString *CoreTestsLogger_lastLogEntry = nil;


@implementation CoreTestsLogger

// Resets the logger.
+ (void)reset {
#   if !__has_feature(objc_arc)
    [CoreTestsLogger_lastLogEntry release];
#   endif
    CoreTestsLogger_lastLogEntry = nil;
}

// Returns an auto-released copy of the last log entry if it exists,
// returns @"NO LOG ENTRY" otherwise.
+ (NSString *)lastLogEntry {
    if (CoreTestsLogger_lastLogEntry == nil) {
        return @"NO LOG ENTRY";
    } else {
        NSString* result = [CoreTestsLogger_lastLogEntry copy];
#       if !__has_feature(objc_arc)
        [result autorelease];
#       endif
        return result;
    }
}

// Logs the given message.
+ (void)logWithComponent:(_lcl_component_t)component level:(_lcl_level_t)level
                  format:(NSString *)format, ... {
    
    // format the args
    va_list args;
    va_start(args, format);
    NSString *formatted_args = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    
    // create log message: "<level header> <component header> <formatted args>"
    NSString *message = [[NSString alloc] initWithFormat:@"%s %s %@", _lcl_level_header[level], _lcl_component_header[component], formatted_args];
#   if !__has_feature(objc_arc)
    [CoreTestsLogger_lastLogEntry release];
#   endif
    CoreTestsLogger_lastLogEntry = [message copy];
    
    // release temporary objects
#   if !__has_feature(objc_arc)
    [message release];
    [formatted_args release];
#   endif
}

@end

