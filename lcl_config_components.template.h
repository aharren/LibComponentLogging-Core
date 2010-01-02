//
//
// lcl_config_components.h
//
//
// Copyright (c) 2008-2009 Arne Harren <ah@0xc0.de>
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

//
// This file contains the definitions of all available log components.
//
// Use the code
//
//   _lcl_component(<identifier>, <header>, <name>)
//
// for defining a log component, where
//
// - <identifier> is the unique name of a log component which is used in calls
//   to lcl_log etc. A symbol 'lcl_c<identifier>' is automatically created for
//   each log component.
//
// - <header> is a C string in UTF-8 which should be used by concrete
//   logging backends when writing a log message for the log component.
//
// - <name> is a C string in UTF-8 which contains the name of the log component
//   and its grouping information. Each group should be separated by the path
//   separator '/'.
// 


#if 0

//
// Example
//
_lcl_component(Main,    "MAIN",         "Tests/Main")
_lcl_component(MainC1,  "MAINC1",       "Tests/Main/C1")
_lcl_component(MainC2,  "MAINC2",       "Tests/Main/C2")

_lcl_component(UI1,     "UI1",          "Tests/UI/1")
_lcl_component(UI2,     "UI2",          "Tests/UI/2")

_lcl_component(LibA1,   "LibA1",        "LibA/Component1")
_lcl_component(LibA2,   "LibA2",        "LibA/Component2")

_lcl_component(LibB1,   "LibB1",        "LibB/Component1")
_lcl_component(LibB2,   "LibB2",        "LibB/Component2")

#endif

