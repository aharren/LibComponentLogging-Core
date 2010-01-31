//
//
// CoreTestsLogComponentsTests.m
//
//
// Copyright (c) 2008-2010 Arne Harren <ah@0xc0.de>
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


@interface CoreTestsLogComponentsTests : SenTestCase {
    
}

@end


@implementation CoreTestsLogComponentsTests

#define _(cstring) ((cstring == NULL) ? @"(null)" : [NSString stringWithUTF8String:cstring])

- (void)testLogComponentsPublicEnumValues {
    STAssertEquals(lcl_cMain, 0, nil);
    STAssertEquals(lcl_cMainComponent1, 1, nil);
    STAssertEquals(lcl_cMainComponent2, 2, nil);
    STAssertEquals(lcl_cMain2, 3, nil);
}

- (void)testLogComponentsPrivateEnumValues {
    STAssertEquals(_lcl_component_t_first, 0, nil);
    STAssertEquals(_lcl_component_t_last, 3, nil);
    STAssertEquals(_lcl_component_t_count, 4, nil);
}

- (void)testLogComponentsIdentifiers {
    STAssertEqualObjects(_(_lcl_component_identifier[lcl_cMain]), _("Main"), nil);
    STAssertEqualObjects(_(_lcl_component_identifier[lcl_cMainComponent1]), _("MainComponent1"), nil);
    STAssertEqualObjects(_(_lcl_component_identifier[lcl_cMainComponent2]), _("MainComponent2"), nil);
    STAssertEqualObjects(_(_lcl_component_identifier[lcl_cMain2]), _("Main2"), nil);
}

- (void)testLogComponentsNames {
    STAssertEqualObjects(_(_lcl_component_name[lcl_cMain]), _("Main"), nil);
    STAssertEqualObjects(_(_lcl_component_name[lcl_cMainComponent1]), _("Main/Component1"), nil);
    STAssertEqualObjects(_(_lcl_component_name[lcl_cMainComponent2]), _("Main/Component2"), nil);
    STAssertEqualObjects(_(_lcl_component_name[lcl_cMain2]), _("Main2"), nil);
}

- (void)testLogComponentsHeaders {
    STAssertEqualObjects(_(_lcl_component_header[lcl_cMain]), _("main"), nil);
    STAssertEqualObjects(_(_lcl_component_header[lcl_cMainComponent1]), _("main.component1"), nil);
    STAssertEqualObjects(_(_lcl_component_header[lcl_cMainComponent2]), _("main.component2"), nil);
    STAssertEqualObjects(_(_lcl_component_header[lcl_cMain2]), _("main2"), nil);
}

@end

