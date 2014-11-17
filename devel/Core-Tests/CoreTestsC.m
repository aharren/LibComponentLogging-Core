//
//
// CoreTestsC.m
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

#import "TestCase.h"
#import "CoreTestsC.h"


@interface CoreTestsC : TestCase {
    
}

@end


@implementation CoreTestsC

- (void)testLoggingViaC {
    lcl_configure_by_component(lcl_cMain, lcl_vTrace);
    c_log_error_main("ErrorMessage");
    AssertEqualObjects(@"E main CoreTestsC.c:32 ErrorMessage", @(c_last_log_entry));
    
    c_log_info_main_component1("InfoMessage");
    AssertEqualObjects(@"E main CoreTestsC.c:32 ErrorMessage", @(c_last_log_entry));
    lcl_configure_by_component(lcl_cMainComponent1, lcl_vTrace);
    c_log_info_main_component1("InfoMessage");
    AssertEqualObjects(@"I main.component1 CoreTestsC.c:36 InfoMessage", @(c_last_log_entry));
}

- (void)testLoggingViaObjectiveC {
    lcl_configure_by_component(lcl_cMain, lcl_vTrace);
    lcl_log(lcl_cMain, lcl_vInfo, "InfoMessage");
    AssertEqualObjects(@"I main CoreTestsC.m:53 InfoMessage", @(c_last_log_entry));
    
    lcl_configure_by_component(lcl_cMainComponent1, lcl_vTrace);
    lcl_log(lcl_cMainComponent1, lcl_vError, "ErrorMessage");
    AssertEqualObjects(@"E main.component1 CoreTestsC.m:57 ErrorMessage", @(c_last_log_entry));
}

@end

