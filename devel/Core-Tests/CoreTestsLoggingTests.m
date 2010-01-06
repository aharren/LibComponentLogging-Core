//
//
// CoreTestsLoggingTests.m
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

#import "lcl.h"
#import <SenTestingKit/SenTestingKit.h>


@interface CoreTestsLoggingTests : SenTestCase {
    
}

@end


@implementation CoreTestsLoggingTests

- (void)setUp {
    [CoreTestsLogger reset];
}

- (void)testLoggingAtLogLevelOff {
    lcl_configure_by_component(lcl_cMain, lcl_vOff);
    lcl_configure_by_component(lcl_cMainComponent1, lcl_vTrace);
    lcl_configure_by_component(lcl_cMainComponent2, lcl_vTrace);
    lcl_configure_by_component(lcl_cMain2, lcl_vTrace);
    
    int counter = 0;
    
    lcl_log(lcl_cMain, lcl_vCritical, @"message %d", ++counter);
    STAssertEqualObjects([CoreTestsLogger lastLogEntry], @"NO LOG ENTRY", nil);
    STAssertEquals(counter, 0, nil);
    
    lcl_log(lcl_cMain, lcl_vError, @"message %d", ++counter);
    STAssertEqualObjects([CoreTestsLogger lastLogEntry], @"NO LOG ENTRY", nil);
    STAssertEquals(counter, 0, nil);
    
    lcl_log(lcl_cMain, lcl_vWarning, @"message %d", ++counter);
    STAssertEqualObjects([CoreTestsLogger lastLogEntry], @"NO LOG ENTRY", nil);
    STAssertEquals(counter, 0, nil);
    
    lcl_log(lcl_cMain, lcl_vInfo, @"message %d", ++counter);
    STAssertEqualObjects([CoreTestsLogger lastLogEntry], @"NO LOG ENTRY", nil);
    STAssertEquals(counter, 0, nil);
    
    lcl_log(lcl_cMain, lcl_vDebug, @"message %d", ++counter);
    STAssertEqualObjects([CoreTestsLogger lastLogEntry], @"NO LOG ENTRY", nil);
    STAssertEquals(counter, 0, nil);
    
    lcl_log(lcl_cMain, lcl_vTrace, @"message %d", ++counter);
    STAssertEqualObjects([CoreTestsLogger lastLogEntry], @"NO LOG ENTRY", nil);
    STAssertEquals(counter, 0, nil);
}

- (void)testLoggingAtLogLevelInfo {
    lcl_configure_by_component(lcl_cMain, lcl_vInfo);
    lcl_configure_by_component(lcl_cMainComponent1, lcl_vOff);
    lcl_configure_by_component(lcl_cMainComponent2, lcl_vOff);
    lcl_configure_by_component(lcl_cMain2, lcl_vOff);
    
    int counter = 0;
    
    lcl_log(lcl_cMain, lcl_vCritical, @"message %d", ++counter);
    STAssertEqualObjects([CoreTestsLogger lastLogEntry], @"CRITICAL Main message 1", nil);
    STAssertEquals(counter, 1, nil);
    
    lcl_log(lcl_cMain, lcl_vError, @"message %d", ++counter);
    STAssertEqualObjects([CoreTestsLogger lastLogEntry], @"ERROR Main message 2", nil);
    STAssertEquals(counter, 2, nil);
    
    lcl_log(lcl_cMain, lcl_vWarning, @"message %d", ++counter);
    STAssertEqualObjects([CoreTestsLogger lastLogEntry], @"WARNING Main message 3", nil);
    STAssertEquals(counter, 3, nil);
    
    lcl_log(lcl_cMain, lcl_vInfo, @"message %d", ++counter);
    STAssertEqualObjects([CoreTestsLogger lastLogEntry], @"INFO Main message 4", nil);
    STAssertEquals(counter, 4, nil);
    
    lcl_log(lcl_cMain, lcl_vDebug, @"message %d", ++counter);
    STAssertEqualObjects([CoreTestsLogger lastLogEntry], @"INFO Main message 4", nil);
    STAssertEquals(counter, 4, nil);
    
    lcl_log(lcl_cMain, lcl_vTrace, @"message %d", ++counter);
    STAssertEqualObjects([CoreTestsLogger lastLogEntry], @"INFO Main message 4", nil);
    STAssertEquals(counter, 4, nil);
}

- (void)testLoggingAtLogLevelTrace {
    lcl_configure_by_component(lcl_cMain, lcl_vTrace);
    lcl_configure_by_component(lcl_cMainComponent1, lcl_vOff);
    lcl_configure_by_component(lcl_cMainComponent2, lcl_vOff);
    lcl_configure_by_component(lcl_cMain2, lcl_vOff);
    
    int counter = 0;
    
    lcl_log(lcl_cMain, lcl_vCritical, @"message %d", ++counter);
    STAssertEqualObjects([CoreTestsLogger lastLogEntry], @"CRITICAL Main message 1", nil);
    STAssertEquals(counter, 1, nil);
    
    lcl_log(lcl_cMain, lcl_vError, @"message %d", ++counter);
    STAssertEqualObjects([CoreTestsLogger lastLogEntry], @"ERROR Main message 2", nil);
    STAssertEquals(counter, 2, nil);
    
    lcl_log(lcl_cMain, lcl_vWarning, @"message %d", ++counter);
    STAssertEqualObjects([CoreTestsLogger lastLogEntry], @"WARNING Main message 3", nil);
    STAssertEquals(counter, 3, nil);
    
    lcl_log(lcl_cMain, lcl_vInfo, @"message %d", ++counter);
    STAssertEqualObjects([CoreTestsLogger lastLogEntry], @"INFO Main message 4", nil);
    STAssertEquals(counter, 4, nil);
    
    lcl_log(lcl_cMain, lcl_vDebug, @"message %d", ++counter);
    STAssertEqualObjects([CoreTestsLogger lastLogEntry], @"DEBUG Main message 5", nil);
    STAssertEquals(counter, 5, nil);
    
    lcl_log(lcl_cMain, lcl_vTrace, @"message %d", ++counter);
    STAssertEqualObjects([CoreTestsLogger lastLogEntry], @"TRACE Main message 6", nil);
    STAssertEquals(counter, 6, nil);
}

@end

