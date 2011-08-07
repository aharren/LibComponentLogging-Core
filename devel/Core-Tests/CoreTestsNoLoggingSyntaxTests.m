//
//
// CoreTestsNoLoggingSyntaxTests.m
//
//
// Copyright (c) 2008-2011 Arne Harren <ah@0xc0.de>
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

#import <SenTestingKit/SenTestingKit.h>


// turn the lcl_log() macro into a no-op
#define _LCL_NO_LOGGING
#import "lcl.h"


@interface CoreTestsNoLoggingSyntaxTests : SenTestCase {
    
}

@end


@implementation CoreTestsNoLoggingSyntaxTests

- (void)setUp {
    [CoreTestsLogger reset];
    lcl_configure_by_component(lcl_cMain, lcl_vTrace);
}

- (void)testStatement {
    int counter = 0;
    
    lcl_log(lcl_cMain, lcl_vCritical, @"message %d", ++counter);
    
    STAssertTrue(lcl_vCritical <= _lcl_component_level[lcl_cMain], nil);
    STAssertEqualObjects([CoreTestsLogger lastLogEntry], @"NO LOG ENTRY", nil);
    STAssertEquals(counter, 0, nil);
}

- (void)testIf {
    int counter = 0;
    
    if (true)
        lcl_log(lcl_cMain, lcl_vCritical, @"if %d", ++counter);
    ++counter;
    
    STAssertTrue(lcl_vCritical <= _lcl_component_level[lcl_cMain], nil);
    STAssertEqualObjects([CoreTestsLogger lastLogEntry], @"NO LOG ENTRY", nil);
    STAssertEquals(counter, 1, nil);
}

- (void)testIfElseIf {
    int counter = 0;
    
    if (true)
        lcl_log(lcl_cMain, lcl_vCritical, @"if %d", ++counter);
    else
        lcl_log(lcl_cMain, lcl_vCritical, @"else %d", ++counter);
    ++counter;
    
    STAssertTrue(lcl_vCritical <= _lcl_component_level[lcl_cMain], nil);
    STAssertEqualObjects([CoreTestsLogger lastLogEntry], @"NO LOG ENTRY", nil);
    STAssertEquals(counter, 1, nil);
}

- (void)testIfElseElse {
    int counter = 0;
    
    if (false)
        lcl_log(lcl_cMain, lcl_vCritical, @"if %d", ++counter);
    else
        lcl_log(lcl_cMain, lcl_vCritical, @"else %d", ++counter);
    ++counter;
    
    STAssertTrue(lcl_vCritical <= _lcl_component_level[lcl_cMain], nil);
    STAssertEqualObjects([CoreTestsLogger lastLogEntry], @"NO LOG ENTRY", nil);
    STAssertEquals(counter, 1, nil);
}

@end

