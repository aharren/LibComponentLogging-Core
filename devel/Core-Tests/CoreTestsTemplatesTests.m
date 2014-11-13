//
//
// CoreTestsTemplatesTests.m
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
#import "TestCase.h"


#ifndef CORE_TESTS_TEMPLATES_BUILD
#error CORE_TESTS_TEMPLATES_BUILD must be defined
#endif


@interface CoreTestsTemplatesTests : TestCase {
    
}

@end


@implementation CoreTestsTemplatesTests

#define _(cstring) ((cstring == NULL) ? @"(null)" : [NSString stringWithUTF8String:cstring])

- (void)testLogComponentsPrivateEnumValues {
    AssertEquals(_lcl_component_t_first, 0);
    AssertEquals(_lcl_component_t_last, 4);
    AssertEquals(_lcl_component_t_count, 5);
}

- (void)testLogComponentsIdentifiers {
    AssertEqualObjects(_(_lcl_component_identifier[lcl_cMain]), _("Main"));
    AssertEqualObjects(_(_lcl_component_identifier[lcl_cMainComponent1]), _("MainComponent1"));
    AssertEqualObjects(_(_lcl_component_identifier[lcl_cMainComponent2]), _("MainComponent2"));
    AssertEqualObjects(_(_lcl_component_identifier[lcl_cMain2]), _("Main2"));
    AssertEqualObjects(_(_lcl_component_identifier[lcl_cMain3]), _("Main3"));
}

- (void)testLogComponentsNames {
    AssertEqualObjects(_(_lcl_component_name[lcl_cMain]), _("Main"));
    AssertEqualObjects(_(_lcl_component_name[lcl_cMainComponent1]), _("Main/Component1"));
    AssertEqualObjects(_(_lcl_component_name[lcl_cMainComponent2]), _("Main/Component2"));
    AssertEqualObjects(_(_lcl_component_name[lcl_cMain2]), _("Main2"));
    AssertEqualObjects(_(_lcl_component_name[lcl_cMain3]), _("Main3"));
}

- (void)testLogComponentsHeaders {
    AssertEqualObjects(_(_lcl_component_header[lcl_cMain]), _("main"));
    AssertEqualObjects(_(_lcl_component_header[lcl_cMainComponent1]), _("main.component1"));
    AssertEqualObjects(_(_lcl_component_header[lcl_cMainComponent2]), _("main.component2"));
    AssertEqualObjects(_(_lcl_component_header[lcl_cMain2]), _("main2"));
    AssertEqualObjects(_(_lcl_component_header[lcl_cMain3]), _("main3"));
}

- (void)testLoggingMacro {
    lcl_configure_by_component(lcl_cMain, lcl_vTrace);
    lcl_log(lcl_cMain, lcl_vInfo, @"Message");
}

@end

