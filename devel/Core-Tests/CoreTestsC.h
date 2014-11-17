//
//
// CoreTestsC.h
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

#include "lcl.h"
#include <stdio.h>


extern char c_last_log_entry[256];

#ifndef _LCL_NO_IGNORE_WARNINGS
#   ifdef __clang__
    // Ignore some warnings about variadic macros when using '-Weverything'.
#   pragma clang diagnostic push
#   pragma clang diagnostic ignored "-Wunknown-pragmas"
#   pragma clang diagnostic ignored "-Wvariadic-macros"
#   pragma clang diagnostic ignored "-Wpedantic"
#   endif
#endif

#define fprintf(_stream, _format, ...)                                         \
    snprintf(c_last_log_entry, 256, _format, ## __VA_ARGS__)

#ifndef _LCL_NO_IGNORE_WARNINGS
#   ifdef __clang__
#   pragma clang diagnostic pop
#   endif
#endif

void c_log_error_main(const char* message);

void c_log_info_main_component1(const char* message);

