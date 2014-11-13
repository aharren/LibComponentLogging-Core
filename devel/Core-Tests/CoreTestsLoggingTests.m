//
//
// CoreTestsLoggingTests.m
//
//
// Copyright (c) 2008-2014 Arne Harren <ah@0xc0.de>
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


@interface CoreTestsLoggingTests : TestCase {
    
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
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"NO LOG ENTRY");
    AssertEquals(counter, 0);
    
    lcl_log(lcl_cMain, lcl_vError, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"NO LOG ENTRY");
    AssertEquals(counter, 0);
    
    lcl_log(lcl_cMain, lcl_vWarning, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"NO LOG ENTRY");
    AssertEquals(counter, 0);
    
    lcl_log(lcl_cMain, lcl_vInfo, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"NO LOG ENTRY");
    AssertEquals(counter, 0);
    
    lcl_log(lcl_cMain, lcl_vDebug, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"NO LOG ENTRY");
    AssertEquals(counter, 0);
    
    lcl_log(lcl_cMain, lcl_vTrace, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"NO LOG ENTRY");
    AssertEquals(counter, 0);
}

- (void)testLoggingAtLogLevelInfo {
    lcl_configure_by_component(lcl_cMain, lcl_vInfo);
    lcl_configure_by_component(lcl_cMainComponent1, lcl_vOff);
    lcl_configure_by_component(lcl_cMainComponent2, lcl_vOff);
    lcl_configure_by_component(lcl_cMain2, lcl_vOff);
    
    int counter = 0;
    
    lcl_log(lcl_cMain, lcl_vCritical, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"CRITICAL main message 1");
    AssertEquals(counter, 1);
    
    lcl_log(lcl_cMain, lcl_vError, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"ERROR main message 2");
    AssertEquals(counter, 2);
    
    lcl_log(lcl_cMain, lcl_vWarning, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"WARNING main message 3");
    AssertEquals(counter, 3);
    
    lcl_log(lcl_cMain, lcl_vInfo, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"INFO main message 4");
    AssertEquals(counter, 4);
    
    lcl_log(lcl_cMain, lcl_vDebug, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"INFO main message 4");
    AssertEquals(counter, 4);
    
    lcl_log(lcl_cMain, lcl_vTrace, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"INFO main message 4");
    AssertEquals(counter, 4);
}

- (void)testLoggingAtLogLevelTrace {
    lcl_configure_by_component(lcl_cMain, lcl_vTrace);
    lcl_configure_by_component(lcl_cMainComponent1, lcl_vOff);
    lcl_configure_by_component(lcl_cMainComponent2, lcl_vOff);
    lcl_configure_by_component(lcl_cMain2, lcl_vOff);
    
    int counter = 0;
    
    lcl_log(lcl_cMain, lcl_vCritical, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"CRITICAL main message 1");
    AssertEquals(counter, 1);
    
    lcl_log(lcl_cMain, lcl_vError, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"ERROR main message 2");
    AssertEquals(counter, 2);
    
    lcl_log(lcl_cMain, lcl_vWarning, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"WARNING main message 3");
    AssertEquals(counter, 3);
    
    lcl_log(lcl_cMain, lcl_vInfo, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"INFO main message 4");
    AssertEquals(counter, 4);
    
    lcl_log(lcl_cMain, lcl_vDebug, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"DEBUG main message 5");
    AssertEquals(counter, 5);
    
    lcl_log(lcl_cMain, lcl_vTrace, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"TRACE main message 6");
    AssertEquals(counter, 6);
}

- (void)testLoggingAtLogLevelOffWithPredicate {
    lcl_configure_by_component(lcl_cMain, lcl_vOff);
    lcl_configure_by_component(lcl_cMainComponent1, lcl_vTrace);
    lcl_configure_by_component(lcl_cMainComponent2, lcl_vTrace);
    lcl_configure_by_component(lcl_cMain2, lcl_vTrace);
    
    int counter = 0;
    int predicateeffect = 0;
    
    lcl_log_if(lcl_cMain, lcl_vCritical, predicateeffect = 1, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"NO LOG ENTRY");
    AssertEquals(counter, 0);
    AssertEquals(predicateeffect, 0);
    
    lcl_log_if(lcl_cMain, lcl_vError, predicateeffect = 2, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"NO LOG ENTRY");
    AssertEquals(counter, 0);
    AssertEquals(predicateeffect, 0);
    
    lcl_log_if(lcl_cMain, lcl_vWarning, predicateeffect = 3, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"NO LOG ENTRY");
    AssertEquals(counter, 0);
    AssertEquals(predicateeffect, 0);
    
    lcl_log_if(lcl_cMain, lcl_vInfo, predicateeffect = 4, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"NO LOG ENTRY");
    AssertEquals(counter, 0);
    AssertEquals(predicateeffect, 0);
    
    lcl_log_if(lcl_cMain, lcl_vDebug, predicateeffect = 5, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"NO LOG ENTRY");
    AssertEquals(counter, 0);
    AssertEquals(predicateeffect, 0);
    
    lcl_log_if(lcl_cMain, lcl_vTrace, predicateeffect = 6, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"NO LOG ENTRY");
    AssertEquals(counter, 0);
    AssertEquals(predicateeffect, 0);
}

- (void)testLoggingAtLogLevelInfoWithPredicate {
    lcl_configure_by_component(lcl_cMain, lcl_vInfo);
    lcl_configure_by_component(lcl_cMainComponent1, lcl_vOff);
    lcl_configure_by_component(lcl_cMainComponent2, lcl_vOff);
    lcl_configure_by_component(lcl_cMain2, lcl_vOff);
    
    int counter = 0;
    int predicateeffect = 0;
    
    lcl_log_if(lcl_cMain, lcl_vCritical, predicateeffect = 1, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"CRITICAL main message 1");
    AssertEquals(counter, 1);
    AssertEquals(predicateeffect, 1);
    
    lcl_log_if(lcl_cMain, lcl_vError, predicateeffect = 2, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"ERROR main message 2");
    AssertEquals(counter, 2);
    AssertEquals(predicateeffect, 2);
    
    lcl_log_if(lcl_cMain, lcl_vWarning, predicateeffect = 3, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"WARNING main message 3");
    AssertEquals(counter, 3);
    AssertEquals(predicateeffect, 3);
    
    lcl_log_if(lcl_cMain, lcl_vInfo, predicateeffect = 4, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"INFO main message 4");
    AssertEquals(counter, 4);
    AssertEquals(predicateeffect, 4);
    
    lcl_log_if(lcl_cMain, lcl_vDebug, predicateeffect = 5, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"INFO main message 4");
    AssertEquals(counter, 4);
    AssertEquals(predicateeffect, 4);
    
    lcl_log_if(lcl_cMain, lcl_vTrace, predicateeffect = 6, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"INFO main message 4");
    AssertEquals(counter, 4);
    AssertEquals(predicateeffect, 4);
}

- (void)testLoggingAtLogLevelTraceWithPredicate {
    lcl_configure_by_component(lcl_cMain, lcl_vTrace);
    lcl_configure_by_component(lcl_cMainComponent1, lcl_vOff);
    lcl_configure_by_component(lcl_cMainComponent2, lcl_vOff);
    lcl_configure_by_component(lcl_cMain2, lcl_vOff);
    
    int counter = 0;
    int predicateeffect = 0;
    
    lcl_log_if(lcl_cMain, lcl_vCritical, predicateeffect = 1, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"CRITICAL main message 1");
    AssertEquals(counter, 1);
    AssertEquals(predicateeffect, 1);
    
    lcl_log_if(lcl_cMain, lcl_vError, predicateeffect = 2, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"ERROR main message 2");
    AssertEquals(counter, 2);
    AssertEquals(predicateeffect, 2);
    
    lcl_log_if(lcl_cMain, lcl_vWarning, predicateeffect = 3, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"WARNING main message 3");
    AssertEquals(counter, 3);
    AssertEquals(predicateeffect, 3);
    
    lcl_log_if(lcl_cMain, lcl_vInfo, predicateeffect = 4, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"INFO main message 4");
    AssertEquals(counter, 4);
    AssertEquals(predicateeffect, 4);
    
    lcl_log_if(lcl_cMain, lcl_vDebug, predicateeffect = 5, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"DEBUG main message 5");
    AssertEquals(counter, 5);
    AssertEquals(predicateeffect, 5);
    
    lcl_log_if(lcl_cMain, lcl_vTrace, predicateeffect = 6, @"message %d", ++counter);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"TRACE main message 6");
    AssertEquals(counter, 6);
    AssertEquals(predicateeffect, 6);
}

@end

