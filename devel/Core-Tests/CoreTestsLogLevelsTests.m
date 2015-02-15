//
//
// CoreTestsLogLevelsTests.m
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


@interface CoreTestsLogLevelsTests : TestCase {
    
}

@end


@implementation CoreTestsLogLevelsTests

#define _(cstring) ((cstring == NULL) ? @"(null)" : [NSString stringWithUTF8String:cstring])

- (void)testLogLevelsPublicEnumValues {
    AssertEquals(lcl_vOff, 0);
    AssertEquals(lcl_vCritical, 1);
    AssertEquals(lcl_vError, 2);
    AssertEquals(lcl_vWarning, 3);
    AssertEquals(lcl_vInfo, 4);
    AssertEquals(lcl_vDebug, 5);
    AssertEquals(lcl_vTrace, 6);
}

- (void)testLogLevelsPrivateEnumValues {
    AssertEquals(_lcl_level_t_first, 0);
    AssertEquals(_lcl_level_t_last, 6);
    AssertEquals(_lcl_level_t_count, 7);
}

- (void)testLogLevelsNames {
    AssertEqualObjects(_(_lcl_level_name[lcl_vOff]), _("Off"));
    AssertEqualObjects(_(_lcl_level_name[lcl_vCritical]), _("Critical"));
    AssertEqualObjects(_(_lcl_level_name[lcl_vError]), _("Error"));
    AssertEqualObjects(_(_lcl_level_name[lcl_vWarning]), _("Warning"));
    AssertEqualObjects(_(_lcl_level_name[lcl_vInfo]), _("Info"));
    AssertEqualObjects(_(_lcl_level_name[lcl_vDebug]), _("Debug"));
    AssertEqualObjects(_(_lcl_level_name[lcl_vTrace]), _("Trace"));
}

- (void)testLogLevelsHeaders {
    AssertEqualObjects(_(_lcl_level_header[lcl_vOff]), _("-"));
    AssertEqualObjects(_(_lcl_level_header[lcl_vCritical]), _("CRITICAL"));
    AssertEqualObjects(_(_lcl_level_header[lcl_vError]), _("ERROR"));
    AssertEqualObjects(_(_lcl_level_header[lcl_vWarning]), _("WARNING"));
    AssertEqualObjects(_(_lcl_level_header[lcl_vInfo]), _("INFO"));
    AssertEqualObjects(_(_lcl_level_header[lcl_vDebug]), _("DEBUG"));
    AssertEqualObjects(_(_lcl_level_header[lcl_vTrace]), _("TRACE"));
}

- (void)testLogLevelsHeadersWith1Character {
    AssertEqualObjects(_(_lcl_level_header_1[lcl_vOff]), _("-"));
    AssertEqualObjects(_(_lcl_level_header_1[lcl_vCritical]), _("C"));
    AssertEqualObjects(_(_lcl_level_header_1[lcl_vError]), _("E"));
    AssertEqualObjects(_(_lcl_level_header_1[lcl_vWarning]), _("W"));
    AssertEqualObjects(_(_lcl_level_header_1[lcl_vInfo]), _("I"));
    AssertEqualObjects(_(_lcl_level_header_1[lcl_vDebug]), _("D"));
    AssertEqualObjects(_(_lcl_level_header_1[lcl_vTrace]), _("T"));
}

- (void)testLogLevelsHeadersWith3Characters {
    AssertEqualObjects(_(_lcl_level_header_3[lcl_vOff]), _("---"));
    AssertEqualObjects(_(_lcl_level_header_3[lcl_vCritical]), _("CRI"));
    AssertEqualObjects(_(_lcl_level_header_3[lcl_vError]), _("ERR"));
    AssertEqualObjects(_(_lcl_level_header_3[lcl_vWarning]), _("WRN"));
    AssertEqualObjects(_(_lcl_level_header_3[lcl_vInfo]), _("INF"));
    AssertEqualObjects(_(_lcl_level_header_3[lcl_vDebug]), _("DBG"));
    AssertEqualObjects(_(_lcl_level_header_3[lcl_vTrace]), _("TRC"));
}

@end

