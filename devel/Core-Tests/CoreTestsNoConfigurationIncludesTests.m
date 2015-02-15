//
//
// CoreTestsNoConfigurationIncludesTests.m
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


#ifndef _LCL_NO_USE_CONFIG_INCLUDES
#error _LCL_NO_USE_CONFIG_INCLUDES must be defined
#endif

#ifndef _LCL_NO_CHECK_HAS_CONFIG_INCLUDES
#error _LCL_NO_CHECK_HAS_CONFIG_INCLUDES must be defined
#endif

#ifdef __lcl_use_config_include_lcl_config_components_h
#error __lcl_use_config_include_lcl_config_components_h should not be defined
#endif

#ifdef __lcl_use_config_include_lcl_config_logger_h
#error __lcl_use_config_include_lcl_config_logger_h should not be defined
#endif

#ifdef __lcl_use_config_include_lcl_config_extensions_h
#error __lcl_use_config_include_lcl_config_extensions_h should not be defined
#endif


@interface CoreTestsNoConfigurationIncludesTests : TestCase {
    
}

@end


@implementation CoreTestsNoConfigurationIncludesTests

#define _(cstring) ((cstring == NULL) ? @"(null)" : [NSString stringWithUTF8String:cstring])

- (void)testLogComponentsPrivateEnumValues {
    AssertEquals(_lcl_component_t_first, 0);
    AssertEquals(_lcl_component_t_last, 0);
    AssertEquals(_lcl_component_t_count, 1);
}

- (void)testLogComponentsIdentifiers {
    AssertEqualObjects(_(_lcl_component_identifier[lcl_cMain]), _("Main"));
}

- (void)testLogComponentsNames {
    AssertEqualObjects(_(_lcl_component_name[lcl_cMain]), _("Main"));
}

- (void)testLogComponentsHeaders {
    AssertEqualObjects(_(_lcl_component_header[lcl_cMain]), _("main"));
}

- (void)testLoggingMacro {
    lcl_configure_by_component(lcl_cMain, lcl_vTrace);
    lcl_log(lcl_cMain, lcl_vInfo, @"Message");
}

@end

