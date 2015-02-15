//
//
// CoreTestsNoLoggingTests.m
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

#import "TestCase.h"


// turn the lcl_log() macro into a no-op
#define _LCL_NO_LOGGING
#import "lcl.h"


@interface CoreTestsNoLoggingTests : TestCase {
    
}

@end


@implementation CoreTestsNoLoggingTests

- (void)setUp {
    [CoreTestsLogger reset];
}

- (void)testNoLogging {
    lcl_configure_by_component(lcl_cMain, lcl_vTrace);
    
    int counter = 0;
    
    lcl_log(lcl_cMain, lcl_vCritical, @"message %d", ++counter);
    AssertTrue(lcl_vCritical <= _lcl_component_level[lcl_cMain]);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"NO LOG ENTRY");
    AssertEquals(counter, 0);
}

- (void)testNoLoggingWithPredicate {
    lcl_configure_by_component(lcl_cMain, lcl_vTrace);
    
    int counter = 0;
    int predicateeffect = 0;
    
    lcl_log_if(lcl_cMain, lcl_vCritical, predicateeffect = 1, @"message %d", ++counter);
    AssertTrue(lcl_vCritical <= _lcl_component_level[lcl_cMain]);
    AssertEqualObjects([CoreTestsLogger lastLogEntry], @"NO LOG ENTRY");
    AssertEquals(counter, 0);
    AssertEquals(predicateeffect, 0);
}

@end

