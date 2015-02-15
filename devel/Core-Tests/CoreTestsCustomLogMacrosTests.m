//
//
// CoreTestsCustomLogMacrosTests.m
//
//
// Copyright (c) 2008-2015 Arne Harren <ah@0xc0.de>
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
#import "TestCase.h"


@interface CoreTestsCustomLogMacrosTests : TestCase {
    
}

@end


@implementation CoreTestsCustomLogMacrosTests

- (void)setUp {
    [CoreTestsLogger reset];
}

- (void)testCustonLogMacrosWithLogComponentAndLevelFromDefine {
    lcl_configure_by_component(lcl_cMain, lcl_vOff);
    lcl_configure_by_component(lcl_cMainComponent1, lcl_vInfo);
    lcl_configure_by_component(lcl_cMainComponent2, lcl_vOff);
    lcl_configure_by_component(lcl_cMain2, lcl_vOff);
    
    int counter = 0;

#   ifdef __clang__
    // Ignore some warnings about variadic macros when using '-Weverything'.
#   pragma clang diagnostic push
#   pragma clang diagnostic ignored "-Wunknown-pragmas"
#   pragma clang diagnostic ignored "-Wvariadic-macros"
#   pragma clang diagnostic ignored "-Wpedantic"
#   endif
    
    // define a custom log macro which references a #define which contains the
    // log component to use and the log level to use
#   define Log(_format, ...) lcl_log(LogComponentToUse, LogLevelToUse, _format, ##__VA_ARGS__);

#ifndef _LCL_NO_IGNORE_WARNINGS
#   ifdef __clang__
#   pragma clang diagnostic pop
#   endif
#endif
    
    // define the log component to use
#   define LogComponentToUse lcl_cMainComponent1
    
    // define the log level to use
#   define LogLevelToUse lcl_vInfo
    
    // create a log entry
    Log(@"message %d from Log macro", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"INFO main.component1 message 1 from Log macro");
    AssertEquals(counter, 1);
}

@end

