//
//
// CoreTestsLogLevelsTests.m
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

#import "lcl.h"
#import <SenTestingKit/SenTestingKit.h>


@interface CoreTestsLogLevelsTests : SenTestCase {
    
}

@end


@implementation CoreTestsLogLevelsTests

#define _(cstring) ((cstring == NULL) ? @"(null)" : [NSString stringWithUTF8String:cstring])

- (void)testLogLevelsPublicEnumValues {
    STAssertEquals(lcl_vOff, 0, nil);
    STAssertEquals(lcl_vCritical, 1, nil);
    STAssertEquals(lcl_vError, 2, nil);
    STAssertEquals(lcl_vWarning, 3, nil);
    STAssertEquals(lcl_vInfo, 4, nil);
    STAssertEquals(lcl_vDebug, 5, nil);
    STAssertEquals(lcl_vTrace, 6, nil);
}

- (void)testLogLevelsPrivateEnumValues {
    STAssertEquals(_lcl_level_t_first, 0, nil);
    STAssertEquals(_lcl_level_t_last, 6, nil);
    STAssertEquals(_lcl_level_t_count, 7, nil);
}

- (void)testLogLevelsNames {
    STAssertEqualObjects(_(_lcl_level_name[lcl_vOff]), _("Off"), nil);
    STAssertEqualObjects(_(_lcl_level_name[lcl_vCritical]), _("Critical"), nil);
    STAssertEqualObjects(_(_lcl_level_name[lcl_vError]), _("Error"), nil);
    STAssertEqualObjects(_(_lcl_level_name[lcl_vWarning]), _("Warning"), nil);
    STAssertEqualObjects(_(_lcl_level_name[lcl_vInfo]), _("Info"), nil);
    STAssertEqualObjects(_(_lcl_level_name[lcl_vDebug]), _("Debug"), nil);
    STAssertEqualObjects(_(_lcl_level_name[lcl_vTrace]), _("Trace"), nil);
}

- (void)testLogLevelsHeaders {
    STAssertEqualObjects(_(_lcl_level_header[lcl_vOff]), _("-"), nil);
    STAssertEqualObjects(_(_lcl_level_header[lcl_vCritical]), _("CRITICAL"), nil);
    STAssertEqualObjects(_(_lcl_level_header[lcl_vError]), _("ERROR"), nil);
    STAssertEqualObjects(_(_lcl_level_header[lcl_vWarning]), _("WARNING"), nil);
    STAssertEqualObjects(_(_lcl_level_header[lcl_vInfo]), _("INFO"), nil);
    STAssertEqualObjects(_(_lcl_level_header[lcl_vDebug]), _("DEBUG"), nil);
    STAssertEqualObjects(_(_lcl_level_header[lcl_vTrace]), _("TRACE"), nil);
}

- (void)testLogLevelsHeadersWith1Character {
    STAssertEqualObjects(_(_lcl_level_header_1[lcl_vOff]), _("-"), nil);
    STAssertEqualObjects(_(_lcl_level_header_1[lcl_vCritical]), _("C"), nil);
    STAssertEqualObjects(_(_lcl_level_header_1[lcl_vError]), _("E"), nil);
    STAssertEqualObjects(_(_lcl_level_header_1[lcl_vWarning]), _("W"), nil);
    STAssertEqualObjects(_(_lcl_level_header_1[lcl_vInfo]), _("I"), nil);
    STAssertEqualObjects(_(_lcl_level_header_1[lcl_vDebug]), _("D"), nil);
    STAssertEqualObjects(_(_lcl_level_header_1[lcl_vTrace]), _("T"), nil);
}

- (void)testLogLevelsHeadersWith3Characters {
    STAssertEqualObjects(_(_lcl_level_header_3[lcl_vOff]), _("---"), nil);
    STAssertEqualObjects(_(_lcl_level_header_3[lcl_vCritical]), _("CRI"), nil);
    STAssertEqualObjects(_(_lcl_level_header_3[lcl_vError]), _("ERR"), nil);
    STAssertEqualObjects(_(_lcl_level_header_3[lcl_vWarning]), _("WRN"), nil);
    STAssertEqualObjects(_(_lcl_level_header_3[lcl_vInfo]), _("INF"), nil);
    STAssertEqualObjects(_(_lcl_level_header_3[lcl_vDebug]), _("DBG"), nil);
    STAssertEqualObjects(_(_lcl_level_header_3[lcl_vTrace]), _("TRC"), nil);
}

@end

