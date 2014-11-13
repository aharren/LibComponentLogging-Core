//
//
// TestCase.h
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

#ifdef __clang__
// Ignore some warnings about variadic macros when using '-Weverything'.
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wvariadic-macros"
#pragma clang diagnostic ignored "-Wpedantic"
#pragma clang diagnostic ignored "-Wobjc-interface-ivars"
#pragma clang diagnostic ignored "-Wdocumentation-unknown-command"
#endif

#import <XCTest/XCTest.h>

#ifdef __clang__
#pragma clang diagnostic pop
#endif

#define TestCase XCTestCase

#ifdef __clang__
#define AssertBegin                                                            \
_Pragma("clang diagnostic push")                                               \
_Pragma("clang diagnostic ignored \"-Wgnu-statement-expression\"")
#define AssertEnd                                                              \
_Pragma("clang diagnostic pop")
#else
#define AssertBegin
#define AssertEnd
#endif

#define AssertTrue(x)                                                          \
    AssertBegin                                                                \
    XCTAssertTrue((x), @"")                                                    \
    AssertEnd

#define AssertEquals(x, y)                                                     \
    AssertBegin                                                                \
    XCTAssertEqual((x), (y), @"")                                              \
    AssertEnd

#define AssertEqualObjects(x, y)                                               \
    AssertBegin                                                                \
    XCTAssertEqualObjects((x), (y), @"")                                       \
    AssertEnd
